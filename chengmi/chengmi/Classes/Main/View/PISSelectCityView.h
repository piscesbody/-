//
//  PISSelectCityView.h
//  chengmi
//
//  Created by 陈宁 on 2017/8/6.
//  Copyright © 2017年 陈宁. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PISCityButton,PISMenuButton;
typedef void(^cictyChange) (NSString *cictyName);

@interface PISSelectCityView : UIView

//修改城市时调用,当按钮被点击时调用
@property (nonatomic, strong) cictyChange changeCictyName;

//根据传入按钮初始化selectView
+ (instancetype)selectCityViewCictyButton:(PISCityButton *)cictyBtn;

//+ (instancetype)sharedSelectCityViewWithCictyButton:(PISCityButton *)cictyBtn;
/*!
 显示selectView
 @param superView    添加到哪个父控件
 @param belowSubView 在哪个子控件后面
 */
- (void)showSelectViewToView:(UIView *)superView belowSubView:(UIView *)belowSubView;
/*!
 销毁selectView
 */
-(void)hideSelectView;

@end
