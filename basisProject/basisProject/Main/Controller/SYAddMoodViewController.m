//
//  SYAddMoodViewController.m
//  basisProject
//
//  Created by syong on 2019/3/1.
//  Copyright © 2019年 shenyong. All rights reserved.
//

#import "SYAddMoodViewController.h"

@interface SYAddMoodViewController ()
@property (weak, nonatomic) IBOutlet UIButton *happyButton;
@property (weak, nonatomic) IBOutlet UIButton *cryButton;

@property (weak, nonatomic) IBOutlet UITextView *textView;

@property (nonatomic,copy) NSString *mood;

@end

@implementation SYAddMoodViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Add mood";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"ok"] style:UIBarButtonItemStyleDone target:self action:@selector(action_sure)];
    _mood = @"1";//happpy
    _textView.layer.masksToBounds = YES;
    _textView.layer.cornerRadius = 10;
}

- (void)action_sure{
    
    if ([_textView.text isEmptyStr]) {
        showError(@"Please enter your mood");
        return;
    }
    
    if (self.addMoodBlock) {
        self.addMoodBlock(_mood, _textView.text);
    }
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
- (IBAction)haapyClick:(id)sender {
    
    [self.happyButton setBackgroundImage:[UIImage imageNamed:@"smile"] forState:0];
    [self.cryButton setBackgroundImage:[UIImage imageNamed:@"cry before"] forState:0];
    _mood = @"1";
    
}
- (IBAction)cryButtonClick:(id)sender {
    [self.happyButton setBackgroundImage:[UIImage imageNamed:@"smile before"] forState:0];
    [self.cryButton setBackgroundImage:[UIImage imageNamed:@"cry after"] forState:0];
    _mood = @"2";
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
