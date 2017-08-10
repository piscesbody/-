//
//  PISConditionView.h
//  chengmi
//
//  Created by 陈宁 on 2017/8/9.
//  Copyright © 2017年 陈宁. All rights reserved.
//  选择查询条件的View (分类,地区,排序,地图)

#import <UIKit/UIKit.h>

@class PISMenuButton,PISConditionView;

//选择查询按钮类型
typedef NS_ENUM(NSInteger,PISConditionButtonType) {
    PISConditionButtonTypeClassify = 10,
    PISConditionButtonTypeArea = 11,
    PISConditionButtonTypeSort = 12,
    PISConditionButtonTypeMap = 13,
    PISConditionButtonTypeList = 14
};

@protocol PISConditionViewDelegate <NSObject>

@optional
//代理方法,按钮点击触发
/** 点击前三个按钮触发代理实践 */
-(void)conditionView:(PISConditionView *)view didButtonClickFrom:(PISConditionButtonType)from to:(PISConditionButtonType)to;

/** 点击了地图按钮,显示地图*/
-(void)conditionViewdidSelectedMap:(PISConditionView *)view;

/** 点击了列表按钮 移除地图View */
-(void)conditionViewdidSelectedList:(PISConditionView *)view;

/** 取消选择按钮 */
-(void)conditionViewCanceSelectButton:(PISConditionView *)view;

@end

@interface PISConditionView : UIView
@property (nonatomic, weak) id<PISConditionViewDelegate> delegate;
/*!
 取消所有按钮的选中状态
 */
-(void)cancelSelectedAllButton;

@end
