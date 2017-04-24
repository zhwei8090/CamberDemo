//
//  ZWCamberView.m
//  CamberDemo
//
//  Created by zhangwei on 17/4/24.
//  Copyright © 2017年 zhangwei. All rights reserved.
//

#import "ZWCamberView.h"
#import "ZWLayout.h"
#import "ZWCell.h"

@interface ZWCamberView()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong ) UICollectionView *collectionView;
@property (nonatomic,strong ) UIImageView *bgImageView;
@property (nonatomic,strong ) ZWLayout *layout;
@end
@implementation ZWCamberView

#define Z_Width  [UIScreen mainScreen].bounds.size.width
#define Z_Height [UIScreen mainScreen].bounds.size.height
#define Z_itemWidth 31
- (instancetype)initWithFrame:(CGRect)frame
{
    if ([super initWithFrame:frame]) {
        
        [self addSubview:self.collectionView];
        [self addSubview:self.bgImageView];
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.collectionView.frame = [UIScreen mainScreen].bounds;
    self.collectionView.frame = self.bounds;
    self.bgImageView.frame = self.bounds;
}

#pragma UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.datas.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ZWCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ZWCell" forIndexPath:indexPath];
    cell.layer.masksToBounds = YES;
    cell.layer.cornerRadius = Z_itemWidth/2.0;
    cell.imageView.image = [UIImage imageNamed:_datas[indexPath.row]];
    
    return cell;
}
#pragma UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.delegate respondsToSelector:@selector(camberView:didSelectItemAtIndex:)]) {
        [self.delegate camberView:self didSelectItemAtIndex:indexPath.row];
    }
}

#pragma get
- (void)setDatas:(NSMutableArray *)datas
{
    _datas = datas;
    [self.collectionView reloadData];
}
- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:self.layout];
        _collectionView.alwaysBounceVertical = YES;
        _collectionView.bounces = YES;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        [_collectionView registerClass:[ZWCell class] forCellWithReuseIdentifier:@"ZWCell"];
    }
    return _collectionView;
}
- (UIImageView *)bgImageView
{
    if (!_bgImageView) {
        _bgImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"椭圆"]];
        _bgImageView.alpha = 0.37;
    }
    return _bgImageView;
}
- (ZWLayout *)layout
{
    if (!_layout) {
        _layout = [[ZWLayout alloc] init];
        // 设置显示个数
        _layout.maxDisplay = 4;
        // 角度(每个item之间的角度)
        _layout.distance = 15;
        // 弧形的半径
        _layout.radius = 175.0;
        // 弧形的圆心
        _layout.center = CGPointMake(400/2, (180)/2);
    }
    return _layout;
}

@end

