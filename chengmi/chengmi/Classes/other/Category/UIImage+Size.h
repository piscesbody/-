//
//  UIImage+Size.h
//  chengmi
//
//  Created by 陈宁 on 2017/8/5.
//  Copyright © 2017年 陈宁. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Size)
//修改image的大小
-(UIImage *)imageByScalingToSize:(CGSize)targetSize;

//控件截屏
+(UIImage *)imageWithCaputureView:(UIView *)view;

@end
