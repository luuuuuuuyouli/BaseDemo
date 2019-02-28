//
//  SYSetupViewController.m
//  basisProject
//
//  Created by syong on 2019/2/28.
//  Copyright © 2019年 shenyong. All rights reserved.
//

#import "SYSetupViewController.h"

@interface SYSetupViewController ()
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UIView *midView;

@end

@implementation SYSetupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"";
    self.tabBarItem.title = @"set up";
    [self.topView az_setGradientBackgroundWithColors:@[rgba(113, 157, 248, 1),rgba(119, 114, 238, 1)] locations:nil startPoint:CGPointMake(0, 0) endPoint:CGPointMake(1, 0)];
    self.midView.layer.cornerRadius = 8;
    [self.midView setLayerShadow];
}



@end
