//
//  SYPickChracterViewController.h
//  basisProject
//
//  Created by syong on 2019/3/1.
//  Copyright © 2019年 shenyong. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^pickPerosonBlock)(NSInteger index);

NS_ASSUME_NONNULL_BEGIN

@interface SYPickChracterViewController : BaseViewController

@property (nonatomic,strong) pickPerosonBlock pickPerosonBlock;

@end

NS_ASSUME_NONNULL_END
