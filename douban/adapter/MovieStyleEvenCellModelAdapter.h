//
//  MovieStyleEvenCellModelAdapter.h
//  douban
//
//  Created by 步宇星 on 2018/6/12.
//  Copyright © 2018年 步宇星. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DataAdapter.h"
#import "MovieStyleEvenCell.h"

@interface MovieStyleEvenCellModelAdapter : NSObject <MovieStyleEvenCellModelProtocol,DataAdapterProtocol>

+ (instancetype) transformWithDataDic:(NSDictionary *)dataDic;

@property (nonatomic, copy) NSString * name;
@property (nonatomic, copy) NSString * average;
@property (nonatomic, copy) NSString * taps;
@property (nonatomic, copy) NSString * imageUrl;

@end

