//
//  SYAddRecordsTopCell.h
//  basisProject
//
//  Created by syong on 2019/2/28.
//  Copyright © 2019年 shenyong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ACMediaFrame.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^cellHeightChangeHeightBlock)(CGFloat height);

typedef void(^UploadMediaBlock)(NSArray<ACMediaModel *> *list);

@interface SYAddRecordsTopCell : UITableViewCell

@property (nonatomic,strong) cellHeightChangeHeightBlock cellHeightChangeHeightBlock;
@property (nonatomic,strong) UploadMediaBlock uploadMediaBlock;


@end

NS_ASSUME_NONNULL_END
