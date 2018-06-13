//
//  MovieStyleEvenCellModelAdapter.m
//  douban
//
//  Created by 步宇星 on 2018/6/12.
//  Copyright © 2018年 步宇星. All rights reserved.
//

#import "MovieStyleEvenCellModelAdapter.h"

@implementation MovieStyleEvenCellModelAdapter

+ (instancetype) transformWithDataDic:(NSDictionary *)dataDic
{
    MovieStyleEvenCellModelAdapter * model = [[MovieStyleEvenCellModelAdapter alloc] init];
    model.name = dataDic[@"title"];
    model.average = [NSString stringWithFormat:@"评分:%.1f",[dataDic[@"rating"][@"average"] floatValue]];
    model.taps = [NSString stringWithFormat:@"标签:%@/",[(NSArray *)dataDic[@"genres"] componentsJoinedByString:@"/"]];
    model.imageUrl = dataDic[@"images"][@"small"];
    return model;
}

@end
