//
//  PISSearchHeadView.m
//  chengmi
//
//  Created by 陈宁 on 2017/8/10.
//  Copyright © 2017年 陈宁. All rights reserved.
//  搜索页tableView的headView

#import "PISSearchHeadView.h"

@implementation PISSearchHeadView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = PISColor(230, 230, 230);
        
        //添加顶部文字label
        self.headTextLabel = [[UILabel alloc]init];
        self.headTextLabel.textColor = [UIColor lightGrayColor];
        self.headTextLabel.font = [UIFont systemFontOfSize:20];
        self.headTextLabel.textAlignment = NSTextAlignmentLeft;
        [self addSubview:self.headTextLabel];
    }
    return self;
}

+(instancetype)headView
{
    PISSearchHeadView *head = [[self alloc]init];
    
    return head;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    //重新布局headView的子控件
    self.headTextLabel.frame = CGRectMake(20, 0, self.bounds.size.width - 20, self.bounds.size.height);
}
@end
