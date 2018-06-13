//
//  RequestFactory.h
//  douban
//
//  Created by 步宇星 on 2018/6/11.
//  Copyright © 2018年 步宇星. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseRequest.h"

@interface RequestFactory : NSObject
//movie
+ (BaseRequest *) top250RequestWithStart:(NSUInteger)start
                                   count:(NSUInteger)count
                                delegate:(id<BaseRequestDelegate>)delegate;

+ (BaseRequest *) inTheatersRequestWithStart:(NSUInteger)start
                                       count:(NSUInteger)count
                                    delegate:(id<BaseRequestDelegate>)delegate;

+ (BaseRequest *) comingSoonRequestWithStart:(NSUInteger)start
                                       count:(NSUInteger)count
                                    delegate:(id<BaseRequestDelegate>)delegate;
// 城市
+ (BaseRequest *) cityRequestWithStart:(NSUInteger)start
                                       count:(NSUInteger)count
                                    delegate:(id<BaseRequestDelegate>)delegate;
@end
