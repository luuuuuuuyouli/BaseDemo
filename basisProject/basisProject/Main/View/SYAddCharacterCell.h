//
//  SYAddCharacterCell.h
//  basisProject
//
//  Created by syong on 2019/2/28.
//  Copyright © 2019年 shenyong. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^AddCharacterBlock)(void);

NS_ASSUME_NONNULL_BEGIN

@interface SYAddCharacterCell : UITableViewCell

@property (nonatomic,strong) NSArray *personArray;

@property (nonatomic,strong) AddCharacterBlock addCharacterBlock;

@end

NS_ASSUME_NONNULL_END
