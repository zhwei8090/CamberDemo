//
//  ZWLayout.h
//  CamberDemo
//
//  Created by zhangwei on 17/4/24.
//  Copyright © 2017年 zhangwei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZWLayout : UICollectionViewFlowLayout

/**
 每个item的角度
 */
@property (nonatomic,assign) float distance;

/**
 显示的个数
 */
@property (nonatomic,assign) float maxDisplay; // 显示的个数

/**
 半径
 */
@property (nonatomic,assign) float radius;

/**
 圆心
 */
@property (nonatomic,assign) CGPoint center;

@end
