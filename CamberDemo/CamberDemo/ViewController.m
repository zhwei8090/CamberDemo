//
//  ViewController.m
//  CamberDemo
//
//  Created by zhangwei on 17/4/24.
//  Copyright © 2017年 zhangwei. All rights reserved.
//

#import "ViewController.h"
#import "ZWCamberView.h"
@interface ViewController ()<ZWCamberViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ZWCamberView *camberView = [[ZWCamberView alloc] init];
    
    // 这里的位置需要和弧形的边缘对于(圆心到按钮中心点位置刚好等于半径才可以)
    camberView.frame = CGRectMake(21, 69, 75.5, 209);
    
    [self.view addSubview:camberView];
    
    camberView.delegate = self;
    
    camberView.datas = [NSMutableArray arrayWithObjects:@"轮子",@"轮子",@"轮子",@"轮子",@"轮子",@"轮子",@"轮子",@"轮子",@"轮子", nil];
    
}

- (void)camberView:(ZWCamberView *)camberView didSelectItemAtIndex:(NSInteger)index
{
       NSLog(@"选择的是%ld",(long)index);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
