//
//  SYPickLabelViewController.h
//  basisProject
//
//  Created by syong on 2019/3/1.
//  Copyright © 2019年 shenyong. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^pickTagsBlock)(NSArray *pickArray);

@interface SYPickLabelViewController : BaseViewController

@property (nonatomic,strong) NSMutableArray *pickArray;

@property (nonatomic,strong) pickTagsBlock pickTagsBlock;

@end

NS_ASSUME_NONNULL_END
