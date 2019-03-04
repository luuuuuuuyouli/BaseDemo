//
//  SYAddRecorContentCell.h
//  basisProject
//
//  Created by syong on 2019/2/28.
//  Copyright © 2019年 shenyong. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^loactionChangeBlock)(NSString *string);

typedef void(^contentChangeBlock)(NSString *string);

@interface SYAddRecorContentCell : UITableViewCell

@property (nonatomic,strong) loactionChangeBlock loactionChangeBlock;
@property (nonatomic,strong) contentChangeBlock contentChangeBlock;

@end

NS_ASSUME_NONNULL_END
