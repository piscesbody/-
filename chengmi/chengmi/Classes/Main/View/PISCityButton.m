//
//  PISCityButton.m
//  chengmi
//
//  Created by 陈宁 on 2017/8/6.
//  Copyright © 2017年 陈宁. All rights reserved.
//

#import "PISCityButton.h"

@implementation PISCityButton

-(void)setHighlighted:(BOOL)highlighted
{
    
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat imageX = self.bounds.size.width / 2 +20;
    self.imageView.frame = CGRectMake(imageX, self.imageView.frame.origin.y, self.imageView.frame.size.width, self.imageView.bounds.size.height);
    
    CGFloat titleX = self.bounds.size.width / 2 -20;
    self.titleLabel.frame = CGRectMake(titleX, self.titleLabel.frame.origin.y, self.titleLabel.frame.size.width, self.titleLabel.bounds.size.height);
}

@end
