//
//  ZWCell.m
//  CamberDemo
//
//  Created by zhangwei on 17/4/24.
//  Copyright © 2017年 zhangwei. All rights reserved.
//

#import "ZWCell.h"

@interface ZWCell()
@property (nonatomic,strong) UIImageView *bgImageView;
@end

@implementation ZWCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.imageView = [[UIImageView alloc] init];
        
        [self.contentView addSubview:self.imageView];
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.imageView.frame = self.bounds;
}

@end
