//
//  MovieSubjectModelAdapter.m
//  douban
//
//  Created by 步宇星 on 2018/6/13.
//  Copyright © 2018年 步宇星. All rights reserved.
//

#import "MovieSubjectModelAdapter.h"
#import "MovieStyleOddCellModelAdapter.h"
#import "MovieStyleEvenCellModelAdapter.h"

@implementation MovieSubjectModelAdapter

+ (id) transformWithDataDic:(NSDictionary *)dataDic {
    NSMutableArray * array = [NSMutableArray array];
    for (NSDictionary * rowdataDic in (NSArray *)(dataDic[@"subjects"])) {
        if ([Util isOdd:rowdataDic[@"rating"][@"average"]]) {
            [array addObject:[MovieStyleOddCellModelAdapter transformWithDataDic:rowdataDic]];
        }
        else
        {
            [array addObject:[MovieStyleEvenCellModelAdapter transformWithDataDic:rowdataDic]];
        }
    }
    return [array copy];
}

@end
