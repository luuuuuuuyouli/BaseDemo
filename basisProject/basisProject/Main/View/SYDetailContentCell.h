//
//  SYDetailContentCell.h
//  basisProject
//
//  Created by syong on 2019/3/1.
//  Copyright © 2019年 shenyong. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SYDetailContentCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *content;
@property (weak, nonatomic) IBOutlet UILabel *loaction;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UILabel *moodString;
@property (weak, nonatomic) IBOutlet UIImageView *moodImg;

@end

NS_ASSUME_NONNULL_END
