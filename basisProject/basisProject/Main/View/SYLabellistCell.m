//
//  SYLabellistCell.m
//  basisProject
//
//  Created by syong on 2019/2/28.
//  Copyright © 2019年 shenyong. All rights reserved.
//

#import "SYLabellistCell.h"

@interface SYLabellistCell()

@property (nonatomic,strong) UIButton *oneLastButton;

@end

@implementation SYLabellistCell

- (void)awakeFromNib {
    [super awakeFromNib];

    
    NSArray *labelArray = @[@"smile",@"Lugu lake",@"Botanical garden",@"travel",@"The cinema ticket",@"movie"];
    
    for (int i = 0; i < labelArray.count; i ++) {
        
        UIButton *button = [[UIButton alloc]init];
        CGSize nameSize = [labelArray[i] sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]}];
        CGFloat btnx = _oneLastButton.x+_oneLastButton.width+15;
        button.frame = CGRectMake(i%3 > 0?btnx:25, 70+i/3*40, nameSize.width+20, 25);
        [button setTitle:labelArray[i] forState:0];
        [button setTitleColor:[UIColor whiteColor] forState:0];
        button.backgroundColor = mainColor;
        button.layer.masksToBounds = YES;
        button.layer.cornerRadius = 10;
        button.titleLabel.font = [UIFont systemFontOfSize:12];
        _oneLastButton = button;
        [self.contentView addSubview:button];
        
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
