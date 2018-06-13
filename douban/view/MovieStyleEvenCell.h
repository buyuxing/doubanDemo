//
//  MovieStyleEvenCell.h
//  douban
//
//  Created by 步宇星 on 2018/6/11.
//  Copyright © 2018年 步宇星. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewCellProtocol.h"

@protocol MovieStyleEvenCellModelProtocol

- (NSString *) name;
- (NSString *) average;
- (NSString *) taps;
- (NSString *) imageUrl;

@end

//评分是偶数的cell
@interface MovieStyleEvenCell : UITableViewCell<TableViewCellProtocol>

- (void) configCellWithModel:(id<MovieStyleEvenCellModelProtocol>)model;

@end
