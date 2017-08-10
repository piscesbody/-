//
//  PISSearchTextField.m
//  chengmi
//
//  Created by 陈宁 on 2017/8/10.
//  Copyright © 2017年 陈宁. All rights reserved.
//  搜索TextFiled

#import "PISSearchTextField.h"

@implementation PISSearchTextField

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.placeholder = @"搜索";
        self.font = [UIFont systemFontOfSize:16];
        
        UIImage *image = [UIImage imageNamed:@"GroupCell"];
        self.background = [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
        self.clearButtonMode = UITextFieldViewModeAlways;
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 5;
        
        //设置文本边框左边专属View
        UIImageView *leftView = [[UIImageView alloc]init];
        leftView.bounds = CGRectMake(0, 0, 35, 35);
//        leftView.contentMode = UIViewContentModeCenter
        
        leftView.image = [UIImage imageNamed:@"searchm"];
        
        self.leftView = leftView;
        self.leftViewMode = UITextFieldViewModeAlways;
    }
    return self;
}

@end
