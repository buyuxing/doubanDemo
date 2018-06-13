//
//  MainTableViewData.m
//  douban
//
//  Created by 步宇星 on 2018/6/11.
//  Copyright © 2018年 步宇星. All rights reserved.
//

#import "MainTableViewData.h"
#import "VCFactory.h"

@interface MainTableViewData()

@property (copy, nonatomic) NSArray * sectionTitles;
@property (copy, nonatomic) NSArray * section0Data;
@property (copy, nonatomic) NSArray * section1Data;

@end

@implementation MainTableViewData

- (instancetype)init
{
    if (self = [super init]) {
        self.sectionTitles = @[@"豆瓣电影",@"其他"];
        self.section0Data = @[@"top250",@"正在热映",@"即将上映"];
        self.section1Data = @[
                              @{@"main":@"苍老师主页",@"sub":@"Present vc"},
                              @{@"main":@"苍老师相册",@"sub":@"Push vc"},
                              @{@"main":@"测试VC",@"sub":@"Present vc"},
                              @{@"main":@"城市列表",@"sub":@"Push vc"}
                            ];
    }
    return self;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.sectionTitles.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return section == 0?self.section0Data.count:self.section1Data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = nil;
    if (indexPath.section == 0) {
        static NSString * section0Identifier = @"section0Identifier";
        cell = [tableView dequeueReusableCellWithIdentifier:section0Identifier];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:section0Identifier];
            cell.imageView.image = [UIImage imageNamed:@"favicon_32x32"];
            cell.textLabel.textColor = [Util greenColor];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        
        cell.textLabel.text = self.section0Data[indexPath.row];
    }
    else{
        static NSString * section1Identifier = @"section1Identifier";
        cell = [tableView dequeueReusableCellWithIdentifier:section1Identifier];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:section1Identifier];
            cell.textLabel.textColor = [Util purpleColor];
            cell.accessoryType = UITableViewCellAccessoryDetailButton;
            cell.tintColor = [Util greenColor];
        }
        NSDictionary * dic = self.section1Data[indexPath.row];
        cell.textLabel.text = dic[@"main"];
        cell.detailTextLabel.text = dic[@"sub"];
    }
    
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return self.sectionTitles[section];
}

#pragma mark - UITableViewDelegate

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel * label = [[UILabel alloc] init];
    label.font = [Util pingFangSCRegularWithSize:17];
    label.textColor = [UIColor colorWithWhite:0.16 alpha:1];
    label.text = [NSString stringWithFormat:@"   %@",[tableView.dataSource tableView:tableView titleForHeaderInSection:section]];
    label.backgroundColor = [UIColor colorWithWhite:0.9686 alpha:1];
    return label;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        UIViewController * vc = nil;
        if (indexPath.row == 0) {
            vc = [VCFactory top250MovieListViewController];
        }
        else if (indexPath.row == 1) {
            vc = [VCFactory inTheatersMovieListViewController];
        }
        else {
            vc = [VCFactory comingsoonMovieListViewController];
            
        }
        vc.title = self.section0Data[indexPath.row];
        [self.parentViewController.navigationController pushViewController:vc animated:YES];
    }
    else
    {
        UIViewController * vc = nil;
        if (indexPath.row == 0) {
            vc = [VCFactory canglaoshiMainViewController];
        }
        else if (indexPath.row == 1) {
            vc = [VCFactory canglaoshiPhotoViewController];
        }
        else if (indexPath.row == 2) {
            vc = [VCFactory testViewController];
        }
        else if (indexPath.row == 3) {
            vc = [VCFactory cityListViewController];
        }
        vc.title = self.section1Data[indexPath.row][@"main"];
        if (indexPath.row == 0 || indexPath.row == 2)
        {
            UINavigationController * nav = [VCFactory standardNavigationControllerWithRooter:vc];
            vc.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"关闭" style:UIBarButtonItemStylePlain target:vc action:@selector(dismiss)];
            [self.parentViewController presentViewController:nav animated:YES completion:nil];
        }
        else
        {
            [self.parentViewController.navigationController pushViewController:vc animated:YES];
        }
    }
}

@end
