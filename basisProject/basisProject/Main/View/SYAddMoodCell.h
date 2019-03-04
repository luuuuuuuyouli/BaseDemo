//
//  SYAddMoodCell.h
//  basisProject
//
//  Created by syong on 2019/2/28.
//  Copyright © 2019年 shenyong. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^AddMoodBlock)(void);

NS_ASSUME_NONNULL_BEGIN

@interface SYAddMoodCell : UITableViewCell

@property (nonatomic,strong) AddMoodBlock addMoodBlock;

@property (nonatomic,strong) NSDictionary *moodDic;

@end

NS_ASSUME_NONNULL_END
