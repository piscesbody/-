//
//  UIBarButtonItem+PISBarButtonItem.h
//  chengmi
//
//  Created by 陈宁 on 2017/8/2.
//  Copyright © 2017年 陈宁. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (PISBarButtonItem)

/*!
 根据图片快速创建一个UIBarButtonItem,返回小号barButtonItem
 */

+(UIBarButtonItem *)initWithNormalImage:(NSString *)image target:(id)target action:(SEL)action;

/*!
 根据图片快速创建一个UIBarButtonItem,返回大号barButtonItem
 */

+(UIBarButtonItem *)initWithNormalImageBig:(NSString *)image target:(id)target action:(SEL)action;

/*!
 根据图片快速创建一个UIBarButtonItem,自定义大小
 */

+(UIBarButtonItem *)initWithNormalImage:(NSString *)image target:(id)target action:(SEL)action width:(CGFloat)width height:(CGFloat)heigth;

/*!
 根据文字快速创建一个UIBarButtonItem,自定义大小
 */

+(UIBarButtonItem *)initWithTitle:(NSString *)title titleColor:(UIColor *)titleColor target:(id)target action:(SEL)action;

@end
