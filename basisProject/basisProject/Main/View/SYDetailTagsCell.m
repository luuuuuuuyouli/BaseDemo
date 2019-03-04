//
//  SYDetailTagsCell.m
//  basisProject
//
//  Created by syong on 2019/3/1.
//  Copyright © 2019年 shenyong. All rights reserved.
//

#import "SYDetailTagsCell.h"

@implementation SYDetailTagsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setTagsArray:(NSArray *)tagsArray{
    _tagsArray = tagsArray;
    for (int i = 0; i < _tagsArray.count; i ++) {
        
        UIButton *button = [[UIButton alloc]init];
        CGSize nameSize = [_tagsArray[i] sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]}];
        CGFloat btnx = _oneLastButton.x+_oneLastButton.width+15;
        button.frame = CGRectMake(i%3 > 0?btnx:20, 50+i/3*40, nameSize.width+20, 25);
        [button setTitle:_tagsArray[i] forState:0];
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
