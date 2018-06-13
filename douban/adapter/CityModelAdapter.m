//
//  CityModelAdapter.m
//  douban
//
//  Created by 步宇星 on 2018/6/13.
//  Copyright © 2018年 步宇星. All rights reserved.
//

#import "CityModelAdapter.h"

@implementation CityModel

@end

@implementation CityModelAdapter

+ (NSArray *)transformWithDataDic:(NSDictionary *)dataDic
{
    NSMutableArray * array = [NSMutableArray array];
    for (NSDictionary * rowDic in dataDic[@"locs"]) {
        CityModel * model = [[CityModel alloc] init];
        model.chineseName = rowDic[@"name"];
        model.pinyinName = rowDic[@"uid"];
        [array addObject:model];
    }
    return [array copy];
}

@end
