//
//  CityListModel.h
//  douban
//
//  Created by 步宇星 on 2018/6/13.
//  Copyright © 2018年 步宇星. All rights reserved.
//

#import "ListModel.h"

@interface CityListModel : ListModel<ListModelDelegate>

+ (instancetype) listWithRequet:(BaseRequest *)requet
                      pagecount:(NSUInteger)pageCount;
@end
