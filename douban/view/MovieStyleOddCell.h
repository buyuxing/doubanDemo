//
//  MovieStyleOddCell.h
//  douban
//
//  Created by 步宇星 on 2018/6/11.
//  Copyright © 2018年 步宇星. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewCellProtocol.h"

@protocol MovieStyleOddCellModelProtocol

- (NSString *) name;
- (NSString *) average;
- (NSString *) posterUrl;
- (NSString *) directorUrl;
- (NSArray<NSString *> *) actorsUrls;

@end

//评分是奇数的cell
@interface MovieStyleOddCell : UITableViewCell<TableViewCellProtocol>

- (void) configCellWithModel:(id<MovieStyleOddCellModelProtocol>)model;

@end
