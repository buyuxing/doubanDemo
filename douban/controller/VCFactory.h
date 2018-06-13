//
//  VCFactory.h
//  douban
//
//  Created by 步宇星 on 2018/6/9.
//  Copyright © 2018年 步宇星. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface VCFactory : NSObject

+ (UINavigationController *) standardNavigationControllerWithRooter:(UIViewController *)rootVC;

+ (UIViewController *) mainViewController;

+ (UIViewController *) top250MovieListViewController;

+ (UIViewController *) inTheatersMovieListViewController;

+ (UIViewController *) comingsoonMovieListViewController;

+ (UIViewController *) cityListViewController;

+ (UIViewController *) canglaoshiMainViewController;

+ (UIViewController *) canglaoshiPhotoViewController;

+ (UIViewController *) testViewController;

@end
