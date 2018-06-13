//
//  RequestFactory.m
//  douban
//
//  Created by 步宇星 on 2018/6/11.
//  Copyright © 2018年 步宇星. All rights reserved.
//

#import "RequestFactory.h"
#import "GetRequest.h"

@implementation RequestFactory

+ (BaseRequest *) top250RequestWithStart:(NSUInteger)start
                                   count:(NSUInteger)count
                                delegate:(id<BaseRequestDelegate>)delegate
{
    return [GetRequest requestWithURL:@"https://api.douban.com/v2/movie/top250" params:@{@"start":@(start),@"count":@(count)} delegate:delegate];
}
+ (BaseRequest *) inTheatersRequestWithStart:(NSUInteger)start
                                       count:(NSUInteger)count
                                    delegate:(id<BaseRequestDelegate>)delegate{
    return [GetRequest requestWithURL:@"https://api.douban.com/v2/movie/in_theaters" params:@{@"start":@(start),@"count":@(count)} delegate:delegate];
}

+ (BaseRequest *) comingSoonRequestWithStart:(NSUInteger)start
                                       count:(NSUInteger)count
                                    delegate:(id<BaseRequestDelegate>)delegate{
    return [GetRequest requestWithURL:@"https://api.douban.com/v2/movie/coming_soon" params:@{@"start":@(start),@"count":@(count)} delegate:delegate];
}

// 城市
+ (BaseRequest *) cityRequestWithStart:(NSUInteger)start
                                 count:(NSUInteger)count
                              delegate:(id<BaseRequestDelegate>)delegate
{
    return [GetRequest requestWithURL:@"https://api.douban.com/v2/loc/list" params:@{@"start":@(start),@"count":@(count)} delegate:delegate];
}

@end
