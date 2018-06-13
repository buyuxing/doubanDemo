//
//  Util.m
//  douban
//
//  Created by 步宇星 on 2018/6/9.
//  Copyright © 2018年 步宇星. All rights reserved.
//

#import "Util.h"

@implementation Util

// 通用颜色
+ (UIColor *) greenColor
{
    return [UIColor colorWithRed:51.0/255 green:116.0/255 blue:37.0/255 alpha:1];
}

+ (UIColor *) purpleColor
{
    return [UIColor colorWithRed:100.0/255 green:5.0/255 blue:255.0/255 alpha:1];
}

+ (UIColor *) orangeColor
{
    return [UIColor orangeColor];
}
// 通用字体

+ (UIFont *) pingFangSCRegularWithSize:(CGFloat)size
{
    return [UIFont fontWithName:@"PingFangSC-Regular" size:size];
}

+ (UIFont *) pingFangSCSemiboldWithSize:(CGFloat)size
{
    return [UIFont fontWithName:@"PingFangSC-Semibold" size:size];
}

// 判断是否在主队列执行
+ (BOOL)isMainQueue {
    static const void* mainQueueKey = @"mainQueue";
    static void* mainQueueContext = @"mainQueue";
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dispatch_queue_set_specific(dispatch_get_main_queue(), mainQueueKey, mainQueueContext, nil);
    });
    return dispatch_get_specific(mainQueueKey) == mainQueueContext;
}

// 判断评分小数点后第一位是不是奇数
+ (BOOL) isOdd:(NSNumber *) number
{
    NSInteger integer =  number.floatValue * 10;
    return integer % 2 != 0;
}
@end
