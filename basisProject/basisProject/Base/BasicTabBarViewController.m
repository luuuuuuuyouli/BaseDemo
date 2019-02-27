//
//  BasicTabBarViewController.m
//  basisProject
//
//  Created by shenyong on 2019/2/27.
//  Copyright © 2019年 shenyong. All rights reserved.
//

#import "BasicTabBarViewController.h"
#import "BasicNavViewController.h"
#import "HomeViewController.h"
#import "PersonViewController.h"
#import "OrderViewController.h"


@interface BasicTabBarViewController ()

@end

@implementation BasicTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addChild];
    //2.设置tabbar的背景色
    self.tabBar.backgroundColor = rgba(57, 57, 57, 1);
    self.tabBar.translucent = NO;
}
- (void)addChild{
    
    HomeViewController *homeVC = [[HomeViewController alloc]init];
    [self addChildViewController:homeVC withNormalImage:@"shouy2" selectedImage:@"zhuye" title:@"首页"];
    
    OrderViewController *orderVC = [[OrderViewController alloc]init];
    [self addChildViewController:orderVC withNormalImage:@"shouy2" selectedImage:@"zhuye" title:@"订单"];
    
    PersonViewController *perosnVC = [[PersonViewController alloc]init];
    [self addChildViewController:perosnVC withNormalImage:@"shouy2" selectedImage:@"zhuye" title:@"我的"];
    
}

-(void)addChildViewController:(UIViewController *)childController withNormalImage:(NSString *)normalImage selectedImage:(NSString *)selectedImage title:(NSString *)title{
    
    //1.设置顶部导航栏标题和底部导航栏标题
    if (title) {
        childController.title = title;
    }
    self.tabBar.tintColor = rgba(70, 165, 59, 1);
    //2.设置普通状态 和 选中状态图片
    if (normalImage) {
        UIImage * img = [[UIImage imageNamed:normalImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        childController.tabBarItem.image = img;
    }
    if (selectedImage) {
        childController.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    //3.创建自定义导航控制器
    BasicNavViewController  *navigationController = [[BasicNavViewController alloc] initWithRootViewController:childController];
    //4.将导航控制器作为子控制器添加到tabbarController上
    [self addChildViewController:navigationController];
    
}



@end
