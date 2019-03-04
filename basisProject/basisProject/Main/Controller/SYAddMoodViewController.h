//
//  SYAddMoodViewController.h
//  basisProject
//
//  Created by syong on 2019/3/1.
//  Copyright © 2019年 shenyong. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^addMoodBlock)(NSString *mood,NSString *mooodSting);

@interface SYAddMoodViewController : BaseViewController

@property (nonatomic,strong) addMoodBlock addMoodBlock;

@end

NS_ASSUME_NONNULL_END
