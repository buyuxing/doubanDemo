//
//  CanglaoshiMainViewController.m
//  douban
//
//  Created by 步宇星 on 2018/6/13.
//  Copyright © 2018年 步宇星. All rights reserved.
//

#import "CanglaoshiMainViewController.h"

@interface CanglaoshiMainViewController ()

@property (nonatomic, weak) UIImageView * imageView;
@property (nonatomic, weak) UILabel * label;

@end

@implementation CanglaoshiMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView * imageView = [[UIImageView alloc] init];
    [imageView setUrl:@"https://gss2.bdstatic.com/9fo3dSag_xI4khGkpoWK1HF6hhy/baike/c0%3Dbaike116%2C5%2C5%2C116%2C38/sign=3d55cb20da00baa1ae214fe92679d277/d1160924ab18972b766f0606edcd7b899f510aa0.jpg" placeholder:[UIImage imageNamed:@"placeHolderImage"]];
    [self.view addSubview:imageView];
    UILabel * label = [[UILabel alloc] init];
    label.text = @"欢迎访问我的主页，我是苍老师";
    label.textColor = [Util purpleColor];
    [self.view addSubview:label];
    
    self.imageView = imageView;
    self.label = label;
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    CGFloat w = self.view.frame.size.width;
    self.imageView.frame = CGRectMake((w - 94)/2, 100, 94, 126);
    [self.label sizeToFit];
    CGRect rect = self.label.frame;
    rect.origin.x = (w - rect.size.width)/2;
    rect.origin.y = self.imageView.frame.origin.y + 140;
    self.label.frame = rect;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
