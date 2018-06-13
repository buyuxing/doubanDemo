//
//  BaseRequest.h
//  douban
//
//  Created by 步宇星 on 2018/6/11.
//  Copyright © 2018年 步宇星. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BaseRequest;

@protocol BaseRequestDelegate

- (void) requestDidFinished:(BaseRequest *)request;

- (void) requestDidFailed:(BaseRequest *)request;

@end

@interface BaseRequest : NSObject
{
    NSHTTPURLResponse * _response;
    NSData * _responseData;
    NSDictionary * _responseObject;
    BOOL _isfetching;
}

@property (nonatomic, copy) NSString * url;
@property (nonatomic, copy) NSDictionary * params;
@property (nonatomic, weak) id<BaseRequestDelegate>delegate;
@property (nonatomic, copy, readonly) NSHTTPURLResponse * response;
@property (nonatomic, copy, readonly) NSData * responseData;
@property (nonatomic, copy, readonly) NSDictionary * responseObject;
@property (nonatomic, assign, readonly)  BOOL isfetching;

+ (instancetype) requestWithURL:(NSString *)url params:(NSDictionary *)params delegate:(id<BaseRequestDelegate>)delegate;

- (void) start;

@end
