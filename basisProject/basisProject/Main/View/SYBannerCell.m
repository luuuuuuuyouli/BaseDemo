//
//  SYBannerCell.m
//  basisProject
//
//  Created by syong on 2019/3/1.
//  Copyright © 2019年 shenyong. All rights reserved.
//

#import "SYBannerCell.h"
#import "SYBannerItemCell.h"

@interface SYBannerCell()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UIView *backView;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout;
@end

@implementation SYBannerCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.backView az_setGradientBackgroundWithColors:@[rgba(113, 157, 248, 1),rgba(119, 114, 238, 1)] locations:nil startPoint:CGPointMake(0, 0) endPoint:CGPointMake(1, 0)];
    [_collectionView setCollectionViewLayout:self.flowLayout];
    //设置数据源

     [self.collectionView az_setGradientBackgroundWithColors:@[rgba(113, 157, 248, 1),rgba(119, 114, 238, 1)] locations:nil startPoint:CGPointMake(0, 0) endPoint:CGPointMake(1, 0)];
    _collectionView.dataSource = self;
    
    // _collectionView.scrollEnabled = NO;
    
    //设置代理
    _collectionView.delegate = self;

    
    [_collectionView registerNib:[UINib nibWithNibName:@"SYBannerItemCell" bundle:nil] forCellWithReuseIdentifier:@"SYBannerItemCell"];
}

- (void)setDataSource:(NSMutableArray *)dataSource{
    _dataSource = dataSource;
    [self.collectionView reloadData];
}



- (UICollectionViewFlowLayout *)flowLayout{
    if (!_flowLayout) {
        _flowLayout = [[UICollectionViewFlowLayout alloc] init];
        //设置ITEM的大小
        //设置每行之间的最小间距
        _flowLayout.minimumLineSpacing = 5.0f;
        //设置每个元素之间的最小间距
        _flowLayout.minimumInteritemSpacing = 5.0f;
        //设置滚动的方向
        _flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        _flowLayout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
    }
    
    return _flowLayout;
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return _dataSource.count;
}


- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    SYBannerItemCell *cell =  [collectionView dequeueReusableCellWithReuseIdentifier:@"SYBannerItemCell" forIndexPath:indexPath];
    NSData *imageData = _dataSource[indexPath.row];
    UIImage *image = [UIImage imageWithData:imageData];
    cell.bannerImg.image =  image;
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake(SCREEN_W-20,180);
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
