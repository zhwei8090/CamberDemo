//
//  ZWCamberView.h
//  CamberDemo
//
//  Created by zhangwei on 17/4/24.
//  Copyright © 2017年 zhangwei. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZWCamberView;

@protocol ZWCamberViewDelegate <NSObject>

@optional

- (void)camberView:(ZWCamberView *)camberView didSelectItemAtIndex:(NSInteger)index;

@end
@interface ZWCamberView : UIView
@property (nonatomic,strong)NSMutableArray *datas;

@property (nonatomic,weak)id<ZWCamberViewDelegate>delegate;
@end
