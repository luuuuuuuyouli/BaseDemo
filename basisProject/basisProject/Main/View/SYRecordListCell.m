//
//  SYRecordListCell.m
//  basisProject
//
//  Created by syong on 2019/2/28.
//  Copyright © 2019年 shenyong. All rights reserved.
//

#import "SYRecordListCell.h"
#import "SYRecordImgItemCell.h"

@interface SYRecordListCell()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *moodImg;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UILabel *loactionLabel;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout;

@property (nonatomic,strong) NSMutableArray *dataSource;

@end

@implementation SYRecordListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    _dataSource = [NSMutableArray array];
    
    [_collectionView setCollectionViewLayout:self.flowLayout];
    //设置数据源

    _collectionView.dataSource = self;
    //设置代理
    _collectionView.delegate = self;
    
    
    [_collectionView registerNib:[UINib nibWithNibName:@"SYRecordImgItemCell" bundle:nil] forCellWithReuseIdentifier:@"SYRecordImgItemCell"];
}

- (void)setDataDic:(NSDictionary *)dataDic{
    
    _dataDic = dataDic;
    
    _timeLabel.text = dataDic[@"time"];
    _contentLabel.text = dataDic[@"content"];
    _loactionLabel.text = dataDic[@"loaction"];
    
    NSString *mood = [NSString stringWithFormat:@"%@",dataDic[@"mood"][@"mood"]];
    
    if ([mood isEqualToString:@"1"]) {
        _moodImg.image = [UIImage imageNamed:@"smile"];
    }else{
         _moodImg.image = [UIImage imageNamed:@"cry after"];
    }
    
    NSArray *imgArray = dataDic[@"img_list"];
    
   // _dataSource
    [_dataSource removeAllObjects];
    for (NSData *imageData in imgArray) {
        
        UIImage *image = [UIImage imageWithData:imageData];
        [_dataSource addObject:image];
    }
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
        
        _flowLayout.sectionInset = UIEdgeInsetsMake(0, 5, 0, 5);
    }
    
    return _flowLayout;
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return _dataSource.count;
}


- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    SYRecordImgItemCell *cell =  [collectionView dequeueReusableCellWithReuseIdentifier:@"SYRecordImgItemCell" forIndexPath:indexPath];
    cell.imgaeView.image = _dataSource[indexPath.row];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake(90,90);
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
