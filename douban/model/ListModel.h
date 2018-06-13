//
//  ListModel.h
//  douban
//
//  Created by 步宇星 on 2018/6/13.
//  Copyright © 2018年 步宇星. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BaseRequest.h"
#import "DataAdapter.h"
#import "TableViewCellProtocol.h"

@protocol ListModelDelegate

+ (Class<TableViewCellProtocol>) tableViewCellClassWithCellRowData:(id)data;
+ (CGFloat) tableViewCellRowHeightWithCellRowData:(id)data;
+ (Class<DataAdapterProtocol>) dataAdapterClass;

@end

@interface ListModel : NSObject <UITableViewDataSource,UITableViewDelegate,BaseRequestDelegate>
@property (nonatomic, strong) BaseRequest * request;
@property (nonatomic, assign) NSUInteger pageCount;
@property (nonatomic, strong) Class<ListModelDelegate> delegeteClass;

+ (instancetype) listWithRequet:(BaseRequest *)requet
                      pagecount:(NSUInteger)pageCount
                  delegeteClass:(Class<ListModelDelegate>)delegeteClass;

- (void) reloadData;

@end
