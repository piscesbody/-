//
//  UIColor+PISColor.h
//  chengmi
//
//  Created by 陈宁 on 2017/8/3.
//  Copyright © 2017年 陈宁. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (PISColor)
/*!
 返回随机颜色
 */
+(instancetype)randColor;

/*!
 将16进制字符串转换成UIColor
 */
+(UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

@end
