//
//  MovieListModel.m
//  douban
//
//  Created by 步宇星 on 2018/6/11.
//  Copyright © 2018年 步宇星. All rights reserved.
//

#import "MovieListModel.h"
#import "MovieSubjectModelAdapter.h"
#import "MovieStyleOddCell.h"
#import "MovieStyleEvenCell.h"
@implementation MovieListModel

+ (instancetype) listWithRequet:(BaseRequest *)requet
                      pagecount:(NSUInteger)pageCount
{
    MovieListModel *model = [MovieListModel listWithRequet:requet pagecount:pageCount delegeteClass:self];
    model.request = requet;
    model.pageCount = pageCount;
    requet.delegate = model;
    return model;
}

#pragma mark - ListModelDelegate

+ (Class<TableViewCellProtocol>) tableViewCellClassWithCellRowData:(id)data{
    if ([data conformsToProtocol:@protocol(MovieStyleEvenCellModelProtocol)]) {
        return [MovieStyleEvenCell class];
    }
    else if ([data conformsToProtocol:@protocol(MovieStyleOddCellModelProtocol)]){
        return [MovieStyleOddCell class];
    }
    return nil;
}

+ (CGFloat) tableViewCellRowHeightWithCellRowData:(id)data
{
    if ([data conformsToProtocol:@protocol(MovieStyleEvenCellModelProtocol)]) {
        return 90;
    }
    else if ([data conformsToProtocol:@protocol(MovieStyleOddCellModelProtocol)]){
        return 180;
    }
    return 44;
}

+ (Class<DataAdapterProtocol>) dataAdapterClass{
    return [MovieSubjectModelAdapter class];
}


@end
