//
//  SYSetupViewController.m
//  basisProject
//
//  Created by syong on 2019/2/28.
//  Copyright © 2019年 shenyong. All rights reserved.
//

#import "SYSetupViewController.h"
#import "SYFeedbackViewController.h"

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
- (IBAction)feedBackClick:(id)sender {
    SYFeedbackViewController *vc = [[SYFeedbackViewController alloc]init];
    [vc setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)contactus:(id)sender {
    
     UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"email" message:@"shenyong95@outlook.com" preferredStyle:UIAlertControllerStyleAlert];
     [alertController addAction:[UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:alertController animated:YES completion:nil];
    
    
}


@end
