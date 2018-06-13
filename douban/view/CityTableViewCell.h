//
//  CityTableViewCell.h
//  douban
//
//  Created by 步宇星 on 2018/6/13.
//  Copyright © 2018年 步宇星. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TableViewCellProtocol.h"

@protocol CityModelProtocol

- (NSString *) chineseName;
- (NSString *) pinyinName;

@end

@interface CityTableViewCell : UITableViewCell <TableViewCellProtocol>

- (void) configCellWithModel:(id<CityModelProtocol>)model;

@end
