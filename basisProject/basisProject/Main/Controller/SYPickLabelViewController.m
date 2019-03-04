//
//  SYPickLabelViewController.m
//  basisProject
//
//  Created by syong on 2019/3/1.
//  Copyright © 2019年 shenyong. All rights reserved.
//

#import "SYPickLabelViewController.h"

@interface SYPickLabelViewController ()

@property (nonatomic,strong) UIButton *oneLastButton;

@end

@implementation SYPickLabelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Add tags";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"ok"] style:UIBarButtonItemStyleDone target:self action:@selector(action_sure)];
    [self configUI];
}

- (void)configUI{
    
    if (!_pickArray) {
        _pickArray = [NSMutableArray array];
    }
    
    
    NSArray *labelArray = @[@"smile",@"Lugu lake",@"Botanical garden",@"travel",@"The cinema ticket",@"movie"];
    
    for (int i = 0; i < labelArray.count; i ++) {
        
        UIButton *button = [[UIButton alloc]init];
        CGSize nameSize = [labelArray[i] sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:11]}];
        CGFloat btnx = _oneLastButton.x+_oneLastButton.width+15;
        button.frame = CGRectMake(i%3 > 0?btnx:20, 70+i/3*40, nameSize.width+20, 25);
        [button setTitle:labelArray[i] forState:0];
        
        [button setTitleColor:mainColor forState:0];
        button.backgroundColor = [UIColor whiteColor];
        button.selected = NO;
        for (UIButton *btn in _pickArray) {
            NSString *str = btn.titleLabel.text;
            if ([str isEqualToString:labelArray[i]]) {
                [button setTitleColor:[UIColor whiteColor] forState:0];
                button.backgroundColor = mainColor;
                button.selected = YES;
            }
        }
    
        button.layer.masksToBounds = YES;
        button.layer.cornerRadius = 10;
        button.layer.borderColor = rgba(119, 114, 238, 1).CGColor;
        button.layer.borderWidth = 1;
        button.titleLabel.font = [UIFont systemFontOfSize:11];
        button.tag =  100 + i;
        [button addTarget:self action:@selector(action_pick:) forControlEvents:UIControlEventTouchUpInside];
        _oneLastButton = button;
        [self.view addSubview:button];
        
    }
}

- (void)action_pick:(UIButton *)sender{

    if (sender.selected) {
        sender.backgroundColor = [UIColor whiteColor];
        [sender setTitleColor:mainColor forState:0];
        sender.selected = NO;
         [_pickArray removeObject:sender];
        
        NSArray *btnArr = [NSArray arrayWithArray:_pickArray];
        
        for (UIButton *btn in btnArr) {
            NSString *str = btn.titleLabel.text;
            if ([str isEqualToString:sender.titleLabel.text]) {
                [_pickArray removeObject:btn];
                
            }
        }
    }else{
        sender.backgroundColor = mainColor;
        [sender setTitleColor:[UIColor whiteColor] forState:0];
        sender.selected = YES;
         [_pickArray addObject:sender];
    }
 
    NSLog(@"%@",_pickArray);
}

- (void)action_sure{
    if (self.pickTagsBlock) {
        self.pickTagsBlock(_pickArray);
        [self.navigationController popViewControllerAnimated:YES];
    }
}




@end
