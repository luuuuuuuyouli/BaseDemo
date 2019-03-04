//
//  SYAddLabelCell.m
//  basisProject
//
//  Created by syong on 2019/2/28.
//  Copyright © 2019年 shenyong. All rights reserved.
//

#import "SYAddLabelCell.h"

@interface SYAddLabelCell()

@property (nonatomic,strong) NSMutableArray *btnArray;
@property (nonatomic,strong) UIButton *oneLastButton;

@end

@implementation SYAddLabelCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _btnArray = [NSMutableArray array];
}
- (void)setTagsArray:(NSArray *)tagsArray{
    _tagsArray = tagsArray;
    for (UIButton *btn in _btnArray) {
        [btn removeFromSuperview];
    }
    [_btnArray removeAllObjects];
   WeakSelf
    [_tagsArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton *button = obj;
        CGFloat btnx = weakSelf.oneLastButton.x+weakSelf.oneLastButton.width+15;
        CGSize nameSize = [button.titleLabel.text sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]}];
        button.frame = CGRectMake(idx%3 > 0?btnx:25, 50+idx/3*40, nameSize.width+20, 25);
        weakSelf.oneLastButton = button;
        [weakSelf.contentView addSubview:button];
        [weakSelf.btnArray addObject:button];
    }];
    
}

- (IBAction)addLabelClick:(id)sender {
    
    if (self.addLabelBlock) {
        self.addLabelBlock();
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
