//
//  SYAddCharacterCell.m
//  basisProject
//
//  Created by syong on 2019/2/28.
//  Copyright © 2019年 shenyong. All rights reserved.
//

#import "SYAddCharacterCell.h"

@interface SYAddCharacterCell()

@property (nonatomic,strong) NSMutableArray *imgArray;
@property (nonatomic,strong) NSMutableArray *labelArray;

@end

@implementation SYAddCharacterCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _imgArray = [NSMutableArray array];
    _labelArray = [NSMutableArray array];
    
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
        
        [headImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(25+i*60);
            make.top.mas_equalTo(50);
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

- (IBAction)addCharacterClick:(id)sender {
    if (self.addCharacterBlock) {
        self.addCharacterBlock();
    }
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
