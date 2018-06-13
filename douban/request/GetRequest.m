//
//  GetRequest.m
//  douban
//
//  Created by 步宇星 on 2018/6/11.
//  Copyright © 2018年 步宇星. All rights reserved.
//

#import "GetRequest.h"

@interface GetRequest()

@end

@implementation GetRequest
- (NSString *) querystring
{
    if (self.params && self.params.count) {
        NSMutableString * string = [@"?" mutableCopy];
        [self.params enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            [string appendString:[NSString stringWithFormat:@"%@=%@&",key,obj]];
        }];
        return [string substringToIndex:[string length]-1];
    }
    return @"";
}

- (NSURLRequest *) createRequest
{
    NSURL * url = [NSURL URLWithString:[self.url stringByAppendingString:[self querystring]]];
    return [[NSURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:30];
}

@end
