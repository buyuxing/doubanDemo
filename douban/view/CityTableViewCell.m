//
//  CityTableViewCell.m
//  douban
//
//  Created by 步宇星 on 2018/6/13.
//  Copyright © 2018年 步宇星. All rights reserved.
//

#import "CityTableViewCell.h"

@implementation CityTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier];
    if (self) {
        self.textLabel.textColor = [Util greenColor];
    }
    return self;
}


- (void) configCellWithModel:(id<CityModelProtocol>)model
{
    self.textLabel.text = model.chineseName;
    self.detailTextLabel.text = model.pinyinName;
}

@end
