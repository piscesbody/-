//
//  PISSelectCityView.m
//  chengmi
//
//  Created by 陈宁 on 2017/8/6.
//  Copyright © 2017年 陈宁. All rights reserved.
//

#import "PISSelectCityView.h"
#import "PISMenuButton.h"
#import "PISCityButton.h"

#define PISAnimateWithDuration 0.3

@interface PISSelectCityView ()

@property (nonatomic, strong) PISMenuButton *firstBtn;
@property (nonatomic, strong) PISMenuButton *secondBtn;
@property (nonatomic, strong) PISMenuButton *thirdBtn;

//记录城市顺序数组
@property (nonatomic, strong) NSArray *cictyNames;

@end

@implementation PISSelectCityView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setUp];
    }
    return self;
}

- (void)awakeFromNib
{
    [self setUp];
}

- (void)setUp
{
    self.alpha = 0;
    
    _firstBtn = [PISMenuButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:self.firstBtn];
    
    _secondBtn = [PISMenuButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:self.secondBtn];
    
    _thirdBtn = [PISMenuButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:self.thirdBtn];
}

+(instancetype)selectCityViewCictyButton:(PISCityButton *)cictyBtn
{
    PISSelectCityView *view = [[self alloc]initWithFrame:CGRectMake(
                                                                    cictyBtn.frame.origin.x,
                                                                    cictyBtn.frame.origin.y,
                                                                    cictyBtn.bounds.size.width,
                                                                    cictyBtn.bounds.size.height * 4)];
    
    NSMutableArray *cictys = [NSMutableArray arrayWithArray:@[@"北京",@"上海",@"广州",@"深圳"]];
    
    NSString *nowCity = [cictyBtn titleForState:UIControlStateNormal];
    
    for (int i = 0; i < cictys.count; i++) {
        if ([cictys[i] isEqualToString:nowCity]) {
            [cictys exchangeObjectAtIndex:i withObjectAtIndex:0];
            break;
        }
    }
    
    view.layer.masksToBounds = YES;
    view.layer.cornerRadius = cictyBtn.layer.cornerRadius;
    view.backgroundColor = cictyBtn.backgroundColor;
    view.cictyNames = cictys;
    
    return view;
}

-(void)setCictyNames:(NSArray *)cictyNames
{
    _cictyNames = cictyNames;
    
    for (int i = 1; i < cictyNames.count; i++) {
        [self setButton:self.subviews[i-1] index:i];
    }
}

//设置view内部按钮位置
-(void)setButton:(PISMenuButton *)btn index:(int)index
{
    CGFloat btnW = self.bounds.size.width;
    CGFloat btnH = self.bounds.size.height / _cictyNames.count;
    CGFloat btnX = 0;
    CGFloat btnFY = btnH;
    
    CGFloat margin = btnW *0.15;
    UIView *whiteLine = [[UIView alloc]initWithFrame:CGRectMake(btnX + margin, index * btnFY, btnW - 2*margin, 1)];
    whiteLine.backgroundColor = [UIColor whiteColor];
    whiteLine.alpha = 0.3;
    [self addSubview:whiteLine];
    
    btn.frame = CGRectMake(btnX, index * btnFY, btnW, btnH);
    btn.backgroundColor = self.backgroundColor;
    [btn setTitle:_cictyNames[index] forState:UIControlStateNormal];
    [btn.titleLabel setFont:[UIFont systemFontOfSize:16]];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
}

//将selectView添加刀superview
-(void)showSelectViewToView:(UIView *)superView belowSubView:(UIView *)belowSubView
{
    [superView insertSubview:self belowSubview:belowSubView];
    
    [UIView animateWithDuration:PISAnimateWithDuration animations:^{
        self.alpha = 0.75;
    }];
}

//移除selectView
-(void)hideSelectView
{
    [UIView animateWithDuration:PISAnimateWithDuration animations:^{
        self.alpha = 0.0;
    }completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

-(void)btnClick:(PISMenuButton *)sender
{
    if (self.changeCictyName) {
        self.changeCictyName([sender titleForState:UIControlStateNormal]);
    }
}


@end
