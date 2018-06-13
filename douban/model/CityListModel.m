//
//  CityListModel.m
//  douban
//
//  Created by 步宇星 on 2018/6/13.
//  Copyright © 2018年 步宇星. All rights reserved.
//

#import "CityListModel.h"
#import "CityTableViewCell.h"
#import "CityModelAdapter.h"
@implementation CityListModel

+ (instancetype) listWithRequet:(BaseRequest *)requet
                      pagecount:(NSUInteger)pageCount
{
    CityListModel *model = [CityListModel listWithRequet:requet pagecount:pageCount delegeteClass:self];
    model.request = requet;
    model.pageCount = pageCount;
    requet.delegate = model;
    return model;
}

#pragma mark - ListModelDelegate

+ (Class<TableViewCellProtocol>) tableViewCellClassWithCellRowData:(id)data{
    return [CityTableViewCell class];
}

+ (CGFloat) tableViewCellRowHeightWithCellRowData:(id)data
{
    return 50;
}

+ (Class<DataAdapterProtocol>) dataAdapterClass{
    return [CityModelAdapter class];
}



@end
