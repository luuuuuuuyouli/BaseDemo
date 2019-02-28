//
//  UIView+shadow.m
//  basisProject
//
//  Created by syong on 2019/2/28.
//  Copyright © 2019年 shenyong. All rights reserved.
//

#import "UIView+shadow.h"

@implementation UIView (shadow)

- (void)setLayerShadow{
    // 设置阴影颜色
    self.layer.shadowColor = RGB16(0x666666).CGColor;
    // 设置阴影的偏移量，默认是（0， -3）
    self.layer.shadowOffset = CGSizeMake(0, -2);
    // 设置阴影不透明度，默认是0
    self.layer.shadowOpacity = 0.7;
    // 设置阴影的半径，默认是3
    self.layer.shadowRadius = 2;
}

@end
