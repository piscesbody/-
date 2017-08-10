//
//  PISRefresgHeader.m
//  chengmi
//
//  Created by 陈宁 on 2017/8/9.
//  Copyright © 2017年 陈宁. All rights reserved.
//

#import "PISRefresgHeader.h"
#import "UIImage+Size.h"

@implementation PISRefresgHeader

#pragma mark - 重写基本方法
#pragma mark 基本设置

-(void)prepare
{
    [super prepare];
    
    //设置普通状态的动画图片
    NSMutableArray *idleImages = [NSMutableArray array];
    for (NSUInteger i = 1; i < 50; i++) {
        NSString *imageName = [NSString stringWithFormat:@"loading_0%02zd",i];
        UIImage *image = [UIImage imageNamed:imageName];
        UIImage *newImage = [image imageByScalingToSize:CGSizeMake(40, 40)];
        [idleImages addObject:newImage];
    }
    
    [self setImages:idleImages forState:MJRefreshStateIdle];
    
    //设置即将刷新状态的动画图片(一松开就会刷新的状态)
    NSMutableArray *refreshingImages = [NSMutableArray array];
    for (NSUInteger i = 50; i < 50; i++) {
        NSString *imageName = [NSString stringWithFormat:@"loading_0%02zd",i];
        UIImage *image = [UIImage imageNamed:imageName];
        UIImage *newImage = [image imageByScalingToSize:CGSizeMake(40, 40)];
        [refreshingImages addObject:newImage];
    }
    [self setImages:refreshingImages forState:MJRefreshStatePulling];
    
    NSMutableArray *startImages = [NSMutableArray array];
//        for (NSUInteger i = 50; i<= 75; i++) {
//            NSString *imageName = [NSString stringWithFormat:@"loading_0%02zd", i];
//            UIImage *image = [UIImage imageNamed:imageName];
//            UIImage *newImage = [image imageByScalingToSize:CGSizeMake(40, 40)];
//            [startImages addObject:newImage];
//        }
    for (NSUInteger i = 50; i <=95 ; i++) {
        NSString *imageName = [NSString stringWithFormat:@"loading_0%02zd",i];
        UIImage *image = [UIImage imageNamed:imageName];
        UIImage *newImage = [image imageByScalingToSize:CGSizeMake(40, 40)];
        [startImages addObject:newImage];
    }
    
    //设置正在刷新状态的动画图片
    [self setImages:startImages forState:MJRefreshStateRefreshing];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
