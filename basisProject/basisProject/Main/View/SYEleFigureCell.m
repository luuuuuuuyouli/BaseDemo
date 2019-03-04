//
//  SYEleFigureCell.m
//  basisProject
//
//  Created by syong on 2019/3/1.
//  Copyright © 2019年 shenyong. All rights reserved.
//

#import "SYEleFigureCell.h"

@interface SYEleFigureCell();


@property (nonatomic,strong) NSMutableArray *imgArray;
@property (nonatomic,strong) NSMutableArray *labelArray;

@end

@implementation SYEleFigureCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setPersonArray:(NSArray *)personArray{
    _personArray = personArray;
    
    for (UIImageView *image in _imgArray) {
        [image removeFromSuperview];
    }
    for (UILabel *label in _labelArray) {
        [label removeFromSuperview];
    }
    
    [_imgArray removeAllObjects];
    [_labelArray removeAllObjects];
    
    for (int i = 0; i < _personArray.count; i ++) {
        
        NSDictionary *dic = _personArray[i];
        UIImageView *headImg = [[UIImageView alloc]init];
        if ([dic[@"sex"] integerValue] == 1) {
            headImg.image = [UIImage imageNamed:@"tx"];
        }else{
            headImg.image = [UIImage imageNamed:@"tx3"];
        }
        [self.contentView addSubview:headImg];
        
        UILabel *name = [[UILabel alloc]init];
        name.text = dic[@"name"];
        name.font = [UIFont systemFontOfSize:12];
        name.textColor = RGB16(0x666666);
        [self.contentView addSubview:name];
        
        UIButton *btn = [[UIButton alloc]init];
        btn.tag = 200 + i;
        [btn addTarget:self action:@selector(action_pick:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:btn];
        
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(25+i*60);
            make.top.mas_equalTo(55);
            make.size.mas_equalTo(40);
        }];
        
        [headImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(25+i*60);
            make.top.mas_equalTo(55);
            make.size.mas_equalTo(35);
        }];
        [name mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(headImg.mas_centerX);
            make.top.equalTo(headImg.mas_bottom).offset(3);
        }];
        
        
        [_imgArray addObject:headImg];
        [_labelArray addObject:name];
        
    }
}

- (void)action_pick:(UIButton *)sender{
    
    NSInteger index = sender.tag - 200;
    
    if (self.pickFigure) {
        self.pickFigure(index);
    }
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
