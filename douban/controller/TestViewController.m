//
//  TestViewController.m
//  douban
//
//  Created by 步宇星 on 2018/6/13.
//  Copyright © 2018年 步宇星. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()

@property (nonatomic, weak) UILabel *label;

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UILabel *label = [[UILabel alloc] init];
    [self.view addSubview:label];
    self.label = label;
    self.label.text = @"我只是用来测试的";
    self.view.backgroundColor = [UIColor whiteColor];
}
- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    [self.label sizeToFit];
    CGRect rect = self.label.frame;
    rect.origin.x = (self.view.frame.size.width - rect.size.width)/2;
    rect.origin.y = (self.view.frame.size.height - rect.size.height)/2;
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
//
//- (void)viewWillAppear:(BOOL)animated{
//    [super viewWillAppear:animated];
//    if (self.presentingViewController) {
//        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"关闭" style:UIBarButtonItemStylePlain target:self action:@selector(dismiss)];
//    }
//}

- (void) dismiss{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
