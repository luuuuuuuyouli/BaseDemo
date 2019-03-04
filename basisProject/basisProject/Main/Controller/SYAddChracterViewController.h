//
//  SYAddChracterViewController.h
//  basisProject
//
//  Created by syong on 2019/3/1.
//  Copyright © 2019年 shenyong. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^addCharacterBlock)(NSString *name,NSString *sex);

@interface SYAddChracterViewController : BaseViewController

@property (nonatomic,strong) addCharacterBlock addCharacterBlock;

@end

NS_ASSUME_NONNULL_END
