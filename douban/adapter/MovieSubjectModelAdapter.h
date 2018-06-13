//
//  MovieSubjectModelAdapter.h
//  douban
//
//  Created by 步宇星 on 2018/6/13.
//  Copyright © 2018年 步宇星. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataAdapter.h"
@interface MovieSubjectModelAdapter : NSObject<DataAdapterProtocol>

+ (NSArray *) transformWithDataDic:(NSDictionary *)dataDic;

@end
