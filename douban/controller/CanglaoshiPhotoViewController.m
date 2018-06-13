//
//  CanglaoshiPhotoViewController.m
//  douban
//
//  Created by 步宇星 on 2018/6/13.
//  Copyright © 2018年 步宇星. All rights reserved.
//

#import "CanglaoshiPhotoViewController.h"

@interface CanglaoshiPhotoViewController ()

@property (nonatomic, weak) UILabel * label;
@property (nonatomic, weak) UIImageView * photoView1;
@property (nonatomic, weak) UIImageView * photoView2;
@property (nonatomic, weak) UIImageView * photoView3;

@end

@implementation CanglaoshiPhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView * imageView = [[UIImageView alloc] init];
    [imageView setUrl:@"https://gss3.bdstatic.com/-Po3dSag_xI4khGkpoWK1HF6hhy/baike/c0%3Dbaike180%2C5%2C5%2C180%2C60/sign=24fcaed30c0828387c00d446d9f0c264/472309f790529822718d3c0fdcca7bcb0b46d4bb.jpg"
          placeholder:[UIImage imageNamed:@"placeHolderImage"]];
    [self.view addSubview:imageView];
    self.photoView1 = imageView;
    
    imageView = [[UIImageView alloc] init];
    [imageView setUrl:@"https://gss2.bdstatic.com/-fo3dSag_xI4khGkpoWK1HF6hhy/baike/c0%3Dbaike220%2C5%2C5%2C220%2C73/sign=b501aead04b30f242197e451a9fcba26/728da9773912b31b7ed9c8e58d18367adbb4e141.jpg"
          placeholder:[UIImage imageNamed:@"placeHolderImage"]];
    [self.view addSubview:imageView];
    self.photoView2 = imageView;
    
    imageView = [[UIImageView alloc] init];
    [imageView setUrl:@"https://gss2.bdstatic.com/9fo3dSag_xI4khGkpoWK1HF6hhy/baike/c0%3Dbaike92%2C5%2C5%2C92%2C30/sign=e0ad791125738bd4d02cba63c0e2ecb3/4a36acaf2edda3cc46c0beec0ae93901203f92d1.jpg"
          placeholder:[UIImage imageNamed:@"placeHolderImage"]];
    [self.view addSubview:imageView];
    self.photoView3 = imageView;
    
    UILabel * label = [[UILabel alloc] init];
    label.text = @"我的私密照片哦";
    label.textColor = [Util purpleColor];
    [self.view addSubview:label];
    
    self.label = label;
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    CGFloat w = self.view.frame.size.width;
    [self.label sizeToFit];
    CGRect rect = self.label.frame;
    rect.origin.x = (w - rect.size.width)/2;
    rect.origin.y = 90;
    self.label.frame = rect;
    
    self.photoView1.frame = CGRectMake(10, 120, (w - 30)/2, (w - 30)/4*3);
    self.photoView2.frame = CGRectMake((w - 30)/2 + 10, 120, (w - 30)/2, (w - 30)/4*3);
    self.photoView3.frame = CGRectMake(50, 130 + (w - 30)/4*3, w-100, w-100);
    
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
