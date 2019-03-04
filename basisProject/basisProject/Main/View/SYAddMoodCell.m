//
//  SYAddMoodCell.m
//  basisProject
//
//  Created by syong on 2019/2/28.
//  Copyright © 2019年 shenyong. All rights reserved.
//

#import "SYAddMoodCell.h"

@interface SYAddMoodCell()

@property (weak, nonatomic) IBOutlet UILabel *moodLabel;

@property (weak, nonatomic) IBOutlet UIImageView *moodImg;



@end

@implementation SYAddMoodCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setMoodDic:(NSDictionary *)moodDic{
    _moodDic = moodDic;

    _moodLabel.text = moodDic[@"moodString"];
    _moodImg.hidden = NO;
    if ([moodDic[@"mood"] integerValue] == 1) {
        _moodImg.image = [UIImage imageNamed:@"smile"];
    }else if([moodDic[@"mood"] integerValue] == 2){
        _moodImg.image = [UIImage imageNamed:@"cry after"];
    }else{
        _moodImg.hidden = YES;
    }
}

- (IBAction)addMoodClick:(id)sender {
    if (self.addMoodBlock) {
        self.addMoodBlock();
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
