//
//  CityModelAdapter.h
//  douban
//
//  Created by 步宇星 on 2018/6/13.
//  Copyright © 2018年 步宇星. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataAdapter.h"
#import "CityTableViewCell.h"

@interface CityModel: NSObject<CityModelProtocol>

@property (nonatomic, copy) NSString * chineseName;
@property (nonatomic, copy) NSString * pinyinName;

@end

@interface CityModelAdapter : NSObject<DataAdapterProtocol>

+ (NSArray *)transformWithDataDic:(NSDictionary *)dataDic;

@end
