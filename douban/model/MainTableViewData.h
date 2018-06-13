//
//  MainTableViewData.h
//  douban
//
//  Created by 步宇星 on 2018/6/11.
//  Copyright © 2018年 步宇星. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MainTableViewData : NSObject<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) UIViewController * parentViewController;

@end
