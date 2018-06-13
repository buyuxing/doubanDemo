//
//  MovieStyleOddCellModelAdapter.m
//  douban
//
//  Created by 步宇星 on 2018/6/12.
//  Copyright © 2018年 步宇星. All rights reserved.
//

#import "MovieStyleOddCellModelAdapter.h"

@implementation MovieStyleOddCellModelAdapter

+ (instancetype) transformWithDataDic:(NSDictionary *)dataDic
{
    MovieStyleOddCellModelAdapter * model = [[MovieStyleOddCellModelAdapter alloc] init];
    model.name = dataDic[@"title"];
    model.average = [NSString stringWithFormat:@"%.1f",[dataDic[@"rating"][@"average"] floatValue]];
    model.posterUrl = dataDic[@"images"][@"small"];
    model.directorUrl = dataDic[@"directors"][0][@"avatars"][@"small"];
    
    NSMutableArray * actors = [NSMutableArray arrayWithCapacity:3];
    
    for (NSDictionary * castDic in dataDic[@"casts"]) {
        [actors addObject:castDic[@"avatars"][@"small"]];
    }
    model.actorsUrls = actors;
    return model;
}

@end
