//
//  SYAddLabelCell.h
//  basisProject
//
//  Created by syong on 2019/2/28.
//  Copyright © 2019年 shenyong. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^AddLabelBlock)(void);

NS_ASSUME_NONNULL_BEGIN

@interface SYAddLabelCell : UITableViewCell

@property (nonatomic,strong) AddLabelBlock addLabelBlock;

@property (nonatomic,strong) NSArray *tagsArray;

@end

NS_ASSUME_NONNULL_END
