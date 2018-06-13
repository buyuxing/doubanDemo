//
//  MovieListModel.h
//  douban
//
//  Created by 步宇星 on 2018/6/11.
//  Copyright © 2018年 步宇星. All rights reserved.
//

#import "ListModel.h"

@interface MovieListModel : ListModel<ListModelDelegate>

+ (instancetype) listWithRequet:(BaseRequest *)requet
                      pagecount:(NSUInteger)pageCount;

@end
