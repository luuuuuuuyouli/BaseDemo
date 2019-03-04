//
//  SYAddChracterViewController.m
//  basisProject
//
//  Created by syong on 2019/3/1.
//  Copyright © 2019年 shenyong. All rights reserved.
//

#import "SYAddChracterViewController.h"

@interface SYAddChracterViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UIView *womenView;
@property (weak, nonatomic) IBOutlet UIView *manView;
@property (nonatomic,copy)  NSString *sex;

@end

@implementation SYAddChracterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Add character";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"ok"] style:UIBarButtonItemStyleDone target:self action:@selector(action_sure)];
    self.nameField.layer.masksToBounds = YES;
    self.nameField.layer.cornerRadius = 10;
    
    self.manView.layer.masksToBounds = YES;
    self.manView.layer.cornerRadius = 5;
    
    self.womenView.layer.masksToBounds = YES;
    self.womenView.layer.cornerRadius = 5;
    self.womenView.hidden = YES;
    
    _sex = @"1";
}

- (void)action_sure{
    
    if ([_sex isEmptyStr]) {
        showError(@"Please select gender！")
        return;
    }
    if ([_nameField.text isEmptyStr]) {
        showError(@"The name cannot be empty！")
        return;
    }
    
    NSUserDefaults *defaults = [[NSUserDefaults alloc]init];
    
    NSArray *list = [defaults valueForKey:@"figure"];
    
    NSMutableArray *mutList = [NSMutableArray array];
    [mutList addObjectsFromArray:list];
    
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[@"name"] = _nameField.text;
    dic[@"sex"] = _sex;
    [mutList addObject:dic];
    
    [defaults setObject:mutList forKey:@"figure"];
    
    [self.navigationController popViewControllerAnimated:YES];
    
    //[defaults setObject:@"" forKey:@""];
    
//    if (self.addCharacterBlock) {
//        self.addCharacterBlock(_nameField.text, _sex);
//        [self.navigationController popViewControllerAnimated:YES];
//    }
}
- (IBAction)manClick:(id)sender {
    self.womenView.hidden = YES;
    self.manView.hidden = NO;
    _sex = @"1";
}
- (IBAction)womenClick:(id)sender {
    self.womenView.hidden = NO;
    self.manView.hidden = YES;
    _sex = @"0";
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
