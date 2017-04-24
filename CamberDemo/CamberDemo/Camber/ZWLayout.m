//
//  ZWLayout.m
//  CamberDemo
//
//  Created by zhangwei on 17/4/24.
//  Copyright © 2017年 zhangwei. All rights reserved.
//

#import "ZWLayout.h"


@interface ZWLayout()
{
    NSMutableArray *_attributeAttay;
    
    
}

@property (nonatomic,assign) int itemCount;

@end
#define Z_Width  [UIScreen mainScreen].bounds.size.width
#define Z_Height [UIScreen mainScreen].bounds.size.height

@implementation ZWLayout

- (void)prepareLayout
{
    [super prepareLayout];
    
    //获取item个数
    _itemCount = (int)[self.collectionView numberOfItemsInSection:0];
    _attributeAttay = [[NSMutableArray alloc] init];

    for(int i = 0; i < _itemCount;i++){
        UICollectionViewLayoutAttributes *attris = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
        // 设置item大小
        attris.size = CGSizeMake(31, 31);
        //计算每个item中心的坐标
        float total = (_maxDisplay -1)*_distance;
        float angle = ((6-i) * _distance + total/2 + (self.collectionView.contentOffset.y))/180* M_PI;
        float x = _center.x-sinf(angle)*(_radius);
        float y = _center.y+cosf(angle)*(_radius)+self.collectionView.contentOffset.y;
        
        attris.center = CGPointMake(x, y);
        [_attributeAttay addObject:attris];
        
    }
    
}
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return _attributeAttay;
}
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return _attributeAttay[indexPath.row];
}
- (CGSize)collectionViewContentSize
{
    return CGSizeMake(self.collectionView.frame.size.width, self.collectionView.frame.size.height + (_itemCount - _maxDisplay)*_distance);
}
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}
@end

