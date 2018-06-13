//
//  Util.h
//  douban
//
//  Created by 步宇星 on 2018/6/9.
//  Copyright © 2018年 步宇星. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

///////////
// import
#import "UIImageView+webimage.h"
#import "UIViewController+dismiss.h"
///////////



@interface Util : NSObject
// 通用颜色
+ (UIColor *) greenColor;

+ (UIColor *) purpleColor;

+ (UIColor *) orangeColor;

// 通用字体

+ (UIFont *) pingFangSCRegularWithSize:(CGFloat)size;

+ (UIFont *) pingFangSCSemiboldWithSize:(CGFloat)size;

// 判断是否在主队列执行
+ (BOOL)isMainQueue;

// 判断评分小数点后第一位是不是奇数
+ (BOOL) isOdd:(NSNumber *) number;

@end
