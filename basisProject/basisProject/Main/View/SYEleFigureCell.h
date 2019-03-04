//
//  SYEleFigureCell.h
//  basisProject
//
//  Created by syong on 2019/3/1.
//  Copyright © 2019年 shenyong. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^pickFigure)(NSInteger index);

NS_ASSUME_NONNULL_BEGIN

@interface SYEleFigureCell : UITableViewCell

@property (nonatomic,strong) NSArray *personArray;
@property (weak, nonatomic) IBOutlet UIButton *addNewBtn;

@property (nonatomic,strong) pickFigure pickFigure;

@end

NS_ASSUME_NONNULL_END
