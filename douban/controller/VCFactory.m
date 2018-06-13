//
//  VCFactory.m
//  douban
//
//  Created by 步宇星 on 2018/6/9.
//  Copyright © 2018年 步宇星. All rights reserved.
//

#import "VCFactory.h"
#import "BYXTableViewController.h"

//mainVC
#import "MainTableViewData.h"

//movielist
#import "MovieListModel.h"
#import "RequestFactory.h"

//citylist
#import "CityListModel.h"

//testVC
#import "TestViewController.h"

//canglaoshi
#import "CanglaoshiMainViewController.h"
#import "CanglaoshiPhotoViewController.h"

const NSUInteger pageCount  = 15;

@implementation VCFactory

+ (UINavigationController *) standardNavigationControllerWithRooter:(UIViewController *)rootVC
{
    UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:rootVC];
    nav.navigationBar.tintColor = [Util purpleColor];
    nav.navigationBar.barTintColor = [Util greenColor];
    nav.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[Util purpleColor]};
    return nav;
}

+ (UIViewController *) mainViewController
{
    MainTableViewData * data = [[MainTableViewData alloc] init];
    UITableViewController * vc = [BYXTableViewController tableViewControllerWithDataSource:data
                                                                                  delegate:data];
    vc.title = @"主页";
    data.parentViewController = vc;
    
    return [self standardNavigationControllerWithRooter:vc];
}

+ (UIViewController *) listViewControllerWithRequest:(BaseRequest *)request
                                           listModel:(ListModel *)listModel
{
    BYXTableViewController * vc = [BYXTableViewController tableViewControllerWithDataSource:listModel
                                                                                   delegate:listModel];
    vc.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"刷新" style:UIBarButtonItemStylePlain target:listModel action:@selector(reloadData)];
    return vc;
}

+ (UIViewController *) movieListViewControllerWithRequest:(BaseRequest *)request
{
    MovieListModel * listModel = [MovieListModel listWithRequet:request pagecount:pageCount];
    return [self listViewControllerWithRequest:request listModel:listModel];
}

+ (UIViewController *) top250MovieListViewController
{
    BaseRequest * request = [RequestFactory top250RequestWithStart:0 count:pageCount delegate:nil];
    return [self movieListViewControllerWithRequest:request];
}

+ (UIViewController *) inTheatersMovieListViewController
{
    BaseRequest * request = [RequestFactory inTheatersRequestWithStart:0 count:pageCount delegate:nil];
    return [self movieListViewControllerWithRequest:request];
}

+ (UIViewController *) comingsoonMovieListViewController
{
    BaseRequest * request = [RequestFactory comingSoonRequestWithStart:0 count:pageCount delegate:nil];
    return [self movieListViewControllerWithRequest:request];
}

+ (UIViewController *) cityListViewController
{
    BaseRequest * request = [RequestFactory cityRequestWithStart:0 count:pageCount delegate:nil];
    CityListModel * listModel = [CityListModel listWithRequet:request pagecount:pageCount];
    return [self listViewControllerWithRequest:request listModel:listModel];
}

+ (UIViewController *) canglaoshiMainViewController
{
    return [[CanglaoshiMainViewController alloc] init];
}

+ (UIViewController *) canglaoshiPhotoViewController
{
    return [[CanglaoshiPhotoViewController alloc] init];
}

+ (UIViewController *) testViewController
{
    
    UIViewController * vc = [[TestViewController alloc] init];
    return vc;
}

@end
