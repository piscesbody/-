//
//  PISLeftMenuView.m
//  chengmi
//
//  Created by 陈宁 on 2017/8/6.
//  Copyright © 2017年 陈宁. All rights reserved.
//  左边View

#import "PISLeftMenuView.h"
#import "PISMenuButton.h"
#import "PISCityButton.h"
#import "PISSelectCityView.h"

//按钮的宽高比例
#define PISBtnScaleForWidth 0.7
#define PISBtnScaleForHeight 0.1

@interface PISLeftMenuView ()

/** 城市选择 */
@property (weak, nonatomic) IBOutlet PISCityButton *cityBtn;
/** 首页 */
@property (weak, nonatomic) IBOutlet PISMenuButton *homeBtn;
/** 发现 */
@property (weak, nonatomic) IBOutlet PISMenuButton *foundBtn;
/** 登录 */
@property (weak, nonatomic) IBOutlet PISMenuButton *iconBtn;

/** 新浪登录 */
@property (weak, nonatomic) IBOutlet PISMenuButton *sinaBtn;

/** 微信登录 */
@property (weak, nonatomic) IBOutlet PISMenuButton *weixinBtn;

/** 消息 */
@property (weak, nonatomic) IBOutlet PISMenuButton *messageBtn;

/** 设置 */
@property (weak, nonatomic) IBOutlet PISMenuButton *setingBtn;

@property (nonatomic, weak) UIButton *selectedBtn;

//选择城市view
@property (nonatomic, weak) PISSelectCityView *selectCityView;


//参照物的约束
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *btnHeightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *btnWidthConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *btnLeftConstraint;

@end

@implementation PISLeftMenuView

-(void)awakeFromNib
{
    //设置cityBtn
    self.cityBtn.layer.masksToBounds = YES;
    self.cityBtn.layer.cornerRadius = 8;
    [self.cityBtn setTitle:@"北京" forState:UIControlStateNormal];
    [self.cityBtn setTitleColor:PISGolbalGreen forState:UIControlStateNormal];
    [self.cityBtn setImage:[UIImage imageNamed:@"city_down"] forState:UIControlStateNormal];
    [self.cityBtn setImage:[UIImage imageNamed:@"city_up"] forState:UIControlStateSelected];
    [self.cityBtn addTarget:self action:@selector(cictyButtonClick:) forControlEvents:UIControlEventTouchDown];
    
    //给按钮添加Tag值
    self.homeBtn.tag = PISleftButtonTypeHome;
    self.foundBtn.tag = PISleftButtonTypeFound;
    self.iconBtn.tag = PISleftButtonTypeIcon;
    self.sinaBtn.tag = PISleftButtonTypeSina;
    self.weixinBtn.tag = PISleftButtonTypeWeiXin;
    self.messageBtn.tag = PISleftButtonTypeMessage;
    self.setingBtn.tag = PISleftButtonTypeSeting;
    
}

-(void)setDelegate:(id<PISLeftMenuViewDelegate>)delegate
{
    _delegate = delegate;
    [self sender:self.homeBtn];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat viewWidth = self.bounds.size.width;
    CGFloat viewHeight = self.bounds.size.height;
    
    CGFloat btnW = viewWidth * PISBtnScaleForWidth;
    CGFloat btnH = viewHeight * PISBtnScaleForHeight;
    CGFloat btnX = (viewWidth - btnW) / 2;
    
    self.btnHeightConstraint.constant = btnH;
    self.btnWidthConstraint.constant = btnW;
    self.btnLeftConstraint.constant = btnX;
    
    [self.setingBtn layoutIfNeeded];
#warning 自动布局 计算间距
    //需要计算间距的距离 图片都是自己直接在app截的,大小不一样,间距大概给模糊值
}

#pragma mark - BtnAction
//leftBtn点击事件

- (IBAction)sender:(PISMenuButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(leftMenuViewButtonClickFrom:to:)]) {
        [self.delegate leftMenuViewButtonClickFrom:(PISleftButtonType)self.selectedBtn.tag to:(PISleftButtonType)sender.tag];
    }
    
    if (sender.tag != PISleftButtonTypeIcon && sender.tag != PISleftButtonTypeSina && sender.tag != PISleftButtonTypeWeiXin) {
        self.selectedBtn.selected = NO;
        sender.selected = YES;
        self.selectedBtn = sender;
    }
    
    if (self.cityBtn.selected) {
        [self cictyButtonClick:self.cityBtn];
    }
}

//cictyBtn的点击事件
-(void)cictyButtonClick:(PISCityButton *)sender
{
    sender.selected = !sender.selected;
    
    if (sender.selected) {
        self.selectCityView = [PISSelectCityView selectCityViewCictyButton:sender];
        //显示选择View
        [self.selectCityView showSelectViewToView:self belowSubView:sender];
        
        //用设置按钮被点击时的回调
        self.selectCityView.changeCictyName = ^(NSString *cictyName)
        {
            [sender setTitle:cictyName forState:UIControlStateNormal];
            [self cictyButtonClick:sender];
            [self sender:self.homeBtn];
        };
    } else {
       //隐藏
        [self.selectCityView hideSelectView];
        self.selectCityView = nil;
    }
}

-(void)coverIsRemove
{
    if (self.cityBtn.selected) {
        [self cictyButtonClick:self.cityBtn];
    }
}


@end
