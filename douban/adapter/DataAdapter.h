//
//  DataAdapter.h
//  douban
//
//  Created by 步宇星 on 2018/6/12.
//  Copyright © 2018年 步宇星. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DataAdapterProtocol <NSObject>

@required
+ (id) transformWithDataDic:(NSDictionary *)dataDic;


@end
