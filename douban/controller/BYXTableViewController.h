//
//  BYXTableViewController.h
//  douban
//
//  Created by 步宇星 on 2018/6/11.
//  Copyright © 2018年 步宇星. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BYXTableViewController : UITableViewController

+ (instancetype) tableViewControllerWithDataSource:(id<UITableViewDataSource>)datasource
                                          delegate:(id<UITableViewDelegate>)delegate;

@end
