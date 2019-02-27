//
//  BaseViewController.m
//  basisProject
//
//  Created by shenyong on 2019/2/27.
//  Copyright © 2019年 shenyong. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];

    if (self.navigationController.viewControllers.count == 1) {
        [[NSNotificationCenter defaultCenter]postNotificationName:@"addShopBadgeValue" object:nil];
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@""] style:UIBarButtonItemStyleDone target:self action:@selector(backs)];
    }
    self.navigationController.navigationBar.barTintColor = nil;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"fanhi"] style:UIBarButtonItemStyleDone target:self action:@selector(backs)];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.tintColor = RGB16(0x333333);
    
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18],NSForegroundColorAttributeName:RGB16(0x333333)}];
    
    UINavigationBar *navigationBar = self.navigationController.navigationBar;
    [navigationBar setBackgroundImage:[UIImage imageNamed:@"whitea.png"]
                       forBarPosition:UIBarPositionAny
                           barMetrics:UIBarMetricsDefault];
    [navigationBar setShadowImage:[UIImage new]];
    
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 43, SCREEN_W, 1)];
    lineView.backgroundColor = RGB16(0xf1f1f1);
    [self.navigationController.navigationBar addSubview:lineView];
}

- (void)backs
{
    [self.navigationController popViewControllerAnimated:YES];
}



@end
