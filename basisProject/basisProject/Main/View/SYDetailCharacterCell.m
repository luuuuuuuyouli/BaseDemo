//
//  SYDetailCharacterCell.m
//  basisProject
//
//  Created by syong on 2019/3/1.
//  Copyright © 2019年 shenyong. All rights reserved.
//

#import "SYDetailCharacterCell.h"

@interface SYDetailCharacterCell()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;



@end

@implementation SYDetailCharacterCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setPersonArray:(NSArray *)personArray{
    _personArray = personArray;
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
        WeakSelf
        [headImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(weakSelf.titleLabel.mas_right).offset(15+i*60);
            make.centerY.equalTo(weakSelf.titleLabel.mas_centerY);
            make.size.mas_equalTo(35);
        }];
        [name mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(headImg.mas_centerX);
            make.top.equalTo(headImg.mas_bottom).offset(3);
        }];
        
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
