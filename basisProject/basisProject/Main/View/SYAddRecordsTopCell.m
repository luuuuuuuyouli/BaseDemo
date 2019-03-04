//
//  SYAddRecordsTopCell.m
//  basisProject
//
//  Created by syong on 2019/2/28.
//  Copyright © 2019年 shenyong. All rights reserved.
//

#import "SYAddRecordsTopCell.h"

@interface SYAddRecordsTopCell()

@property (nonatomic,strong)  ACSelectMediaView *mediaView;

@end

@implementation SYAddRecordsTopCell

- (void)awakeFromNib {
    [super awakeFromNib];
    if (!_mediaView) {
        ACSelectMediaView *mediaView = [[ACSelectMediaView alloc] initWithFrame:CGRectMake(0, 0,self.width, 130)];
        //媒体的资源类型
        mediaView.type = ACMediaTypePhotoAndCamera;
        //最大图片、视频选择个数
        mediaView.maxImageSelected = 6;
        //自定义导航栏颜色
        //录制视频最大时间
        mediaView.naviBarBgColor = mainColor;
        mediaView.videoMaximumDuration = 15.0;
        mediaView.rowImageCount = 3;
        mediaView.lineSpacing = 20;
        mediaView.interitemSpacing = 20;
        mediaView.sectionInset = UIEdgeInsetsMake(20, 20, 20, 20);
        //选中资源后的回调
        WeakSelf
        [mediaView observeViewHeight:^(CGFloat mediaHeight) {
            NSLog(@"%lf",mediaHeight);
            if (weakSelf.cellHeightChangeHeightBlock) {
                weakSelf.cellHeightChangeHeightBlock(mediaHeight);
            }
        }];
        
        [mediaView observeSelectedMediaArray:^(NSArray<ACMediaModel *> *list) {
            if (weakSelf.uploadMediaBlock) {
                weakSelf.uploadMediaBlock(list);
            }
        }];
        
        _mediaView = mediaView;
    }
    [self.contentView addSubview:_mediaView];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
