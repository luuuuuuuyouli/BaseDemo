//
//  SYFeedbackViewController.m
//  basisProject
//
//  Created by syong on 2019/3/4.
//  Copyright © 2019年 shenyong. All rights reserved.
//

#import "SYFeedbackViewController.h"

@interface SYFeedbackViewController ()
@property (weak, nonatomic) IBOutlet UIButton *sureBtn;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation SYFeedbackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Feedback";
    self.sureBtn.layer.masksToBounds = YES;
    self.sureBtn.layer.cornerRadius = 8;
     [self.sureBtn az_setGradientBackgroundWithColors:@[rgba(113, 157, 248, 1),rgba(119, 114, 238, 1)] locations:nil startPoint:CGPointMake(0, 0) endPoint:CGPointMake(1, 0)];
}
- (IBAction)sureBtnClick:(id)sender {
    
    if ([_textView.text isEmptyStr]) {
        showError(@"Please input feedback")
        return;
    }
    
    showSuccess(@"Submitted successfully")
}



@end
