//
//  BasicTabBarViewController.m
//  basisProject
//
//  Created by shenyong on 2019/2/27.
//  Copyright © 2019年 shenyong. All rights reserved.
//

#import "BasicTabBarViewController.h"
#import "BasicNavViewController.h"
#import "SYHomeViewController.h"
#import "SYElementViewController.h"
#import "SYSetupViewController.h"



@interface BasicTabBarViewController ()

@end

@implementation BasicTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil] forState:UIControlStateNormal];

    
    [self addChild];
    //2.设置tabbar的背景
    
     //[self.tabBarItem az_setGradientBackgroundWithColors:@[rgba(113, 157, 248, 1),rgba(119, 114, 238, 1)] locations:nil startPoint:CGPointMake(0, 0) endPoint:CGPointMake(1, 0)];
    
   // self.tabBar.barTintColor = [UIColor redColor];
    
    NSString *imageName = @"";
    
    if (SCREEN_W == 375) {
        imageName = @"tabbar_2x";
    }else if (SCREEN_W == 414){
        imageName = @"tabbar_plus";
    }else if(SCREEN_H >= 812 ){
        imageName = @"tabbar_plus";
    }else{
        imageName = @"tabbar_2x";
    }
    
    [self.tabBar setBackgroundImage:[UIImage imageNamed:imageName]];
    
   // [[UITabBar appearance] setBarTintColor:rgba(113, 157, 248, 1)];
    
    [UITabBar appearance].translucent = NO;
}
- (void)addChild{
    
    SYHomeViewController *homeVC = [[SYHomeViewController alloc]init];
    [self addChildViewController:homeVC withNormalImage:@"record_before" selectedImage:@"record_after" title:@"record"];

    SYElementViewController *orderVC = [[SYElementViewController alloc]init];
    [self addChildViewController:orderVC withNormalImage:@"element_before" selectedImage:@"element_after" title:@"element"];

    SYSetupViewController *perosnVC = [[SYSetupViewController alloc]init];
    [self addChildViewController:perosnVC withNormalImage:@"sz_before" selectedImage:@"sz_after" title:@"set up"];
    
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
