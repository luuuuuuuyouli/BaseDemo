//
//  SYBannerItemCell.m
//  basisProject
//
//  Created by syong on 2019/3/1.
//  Copyright © 2019年 shenyong. All rights reserved.
//

#import "SYBannerItemCell.h"

@implementation SYBannerItemCell

- (void)awakeFromNib {
    [super awakeFromNib];
     _bannerImg.layer.cornerRadius = 14;
    [self addShadowToView:_bannerImg withColor:RGB16(0x333333)];
   
}

/// 添加四边阴影效果
- (void)addShadowToView:(UIView *)theView withColor:(UIColor *)theColor {
    // 阴影颜色
    theView.layer.shadowColor = theColor.CGColor;
    // 阴影偏移，默认(0, -3)
    theView.layer.shadowOffset = CGSizeMake(0,1);
    // 阴影透明度，默认0
    theView.layer.shadowOpacity = 0.5;
    // 阴影半径，默认3
    theView.layer.shadowRadius = 2.0f;
    
}

@end
