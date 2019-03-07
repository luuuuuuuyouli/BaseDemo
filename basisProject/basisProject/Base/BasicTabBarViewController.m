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
    
    CGRect frame = CGRectMake(0, 0, SCREEN_W, kTabBarHeight);
    
    UIImageView *imgview = [[UIImageView alloc]initWithFrame:frame];
    
    UIGraphicsBeginImageContext(imgview.frame.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
    
    CGContextScaleCTM(context, frame.size.width, frame.size.height);
    
    CGFloat colors[] = {
        
        113.0/255.0, 157.0/255.0, 248.0/255.0, 1.0,
        
        119.0/255.0, 114.0/255.0, 238.0/255.0, 1.0,
        
    };
    
    CGGradientRef backGradient = CGGradientCreateWithColorComponents(rgb, colors, NULL, sizeof(colors)/(sizeof(colors[0])*4));
    
    CGColorSpaceRelease(rgb);
    
    //设置颜色渐变的方向，范围在(0,0)与(1.0,1.0)之间，如(0,0)(1.0,0)代表水平方向渐变,(0,0)(0,1.0)代表竖直方向渐变
    CGContextDrawLinearGradient(context, backGradient, CGPointMake(0, 0), CGPointMake(1.0, 0), kCGGradientDrawsBeforeStartLocation);
    
    [self.tabBar setBackgroundImage:UIGraphicsGetImageFromCurrentImageContext()];

    
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
