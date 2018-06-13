//
//  ListModel.m
//  douban
//
//  Created by 步宇星 on 2018/6/13.
//  Copyright © 2018年 步宇星. All rights reserved.
//

#import "ListModel.h"

@interface ListModel()

@property (nonatomic,   weak) UITableView * tableview;
@property (nonatomic,   copy) NSArray * movieDataArray;

@end


@implementation ListModel

+ (instancetype) listWithRequet:(BaseRequest *)requet
                      pagecount:(NSUInteger)pageCount
                  delegeteClass:(Class<ListModelDelegate>)delegeteClass;
{
    ListModel *model =  [[ListModel alloc] init];
    model.delegeteClass = delegeteClass;
    model.request = requet;
    model.pageCount = pageCount;
    requet.delegate = model;
    return model;
}

- (NSArray *) movieDataArray
{
    if (!_movieDataArray) {
        _movieDataArray = [NSArray array];
    }
    return _movieDataArray;
}

- (void) reloadData
{
    self.movieDataArray = nil;
    self.request.params = @{@"start":@(0),@"count":@(self.pageCount)};
    [self.request start];
    [self.tableview reloadData];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (!self.tableview) {
        self.tableview = tableView;
        [self reloadData];
    }
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.movieDataArray.count + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = nil;
    if (indexPath.row < self.movieDataArray.count) {
        id data = self.movieDataArray[indexPath.row];
        
        Class cls = [self.delegeteClass tableViewCellClassWithCellRowData:data];
        NSString * identifier = NSStringFromClass(cls);
        cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(cls)];
        if (!cell) {
            cell = [[cls alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        
        [cell performSelector:@selector(configCellWithModel:) withObject:data];
    }
    else
    {
        static NSString * bottomIdentifier = @"bottomIdentifier";
        cell = [tableView dequeueReusableCellWithIdentifier:bottomIdentifier];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:bottomIdentifier];
            cell.textLabel.textAlignment = NSTextAlignmentCenter;
        }
        cell.textLabel.text = self.request.isfetching?@"正在加载...":[NSString stringWithFormat:@"点击加载%lu条数据(%lu已加载)",(unsigned long)self.pageCount,(unsigned long)self.movieDataArray.count];
    }
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row < self.movieDataArray.count) {
        return;
    }
    else
    {
        self.request.params = @{@"start":@(self.movieDataArray.count),@"count":@(self.pageCount)};
        [self.request start];
        [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row < self.movieDataArray.count) {
        id data = self.movieDataArray[indexPath.row];
        return [self.delegeteClass tableViewCellRowHeightWithCellRowData:data];
    }
    return 44;
}

#pragma mark - BaseRequestDelegate


- (void) requestDidFinished:(BaseRequest *)request
{
    if (request.responseObject) {
        self.movieDataArray = [self.movieDataArray arrayByAddingObjectsFromArray:[[self.delegeteClass dataAdapterClass] transformWithDataDic:request.responseObject]];
        [self.tableview reloadData];
    }
}

- (void) requestDidFailed:(BaseRequest *)request
{
    
}
@end
