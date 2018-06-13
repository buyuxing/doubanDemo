//
//  BaseRequest.m
//  douban
//
//  Created by 步宇星 on 2018/6/11.
//  Copyright © 2018年 步宇星. All rights reserved.
//

#import "BaseRequest.h"

@interface BaseRequest()

@property (nonatomic, copy, readwrite) NSHTTPURLResponse * response;
@property (nonatomic, copy, readwrite) NSData * responseData;
@property (nonatomic, copy, readwrite) NSDictionary * responseObject;

@end

@implementation BaseRequest

+ (instancetype) requestWithURL:(NSString *)url params:(NSDictionary *)params delegate:(id<BaseRequestDelegate>)delegate
{
    BaseRequest * baseRequest = [[self alloc] init];
    baseRequest.url = url;
    baseRequest.params = params;
    baseRequest.delegate = delegate;
    return baseRequest;
}

- (NSURLSessionDataTask *) createSessionDataTaskWithRequest:(NSURLRequest *)request
{
    NSURLSessionDataTask * task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        self->_isfetching = NO;
        if (error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.delegate requestDidFailed:self];
                self->_isfetching = NO;
            });
        }
        else
        {
            self->_response = (NSHTTPURLResponse *)response;
            if (self->_response.statusCode == 200) {
                self->_responseData = data;
                self->_responseObject = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.delegate requestDidFinished:self];
                    self->_isfetching = NO;
                });
            }
            else
            {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.delegate requestDidFailed:self];
                    self->_isfetching = NO;
                });
            }
        }
    }];
    return task;
}

- (NSURLRequest *) createRequest
{
    return [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:self.url]];
}

- (void)start
{
    if ([Util isMainQueue]) {
        if (self.isfetching) {
            return;
        }
        _isfetching = YES;
        NSURLSessionDataTask * task = [self createSessionDataTaskWithRequest:[self createRequest]];
        [task resume];
    }
    else{
        dispatch_async(dispatch_get_main_queue(), ^{
            [self start];
        });
    }
}

@end
