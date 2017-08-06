//
//  PISLeftMenuView.h
//  chengmi
//
//  Created by 陈宁 on 2017/8/6.
//  Copyright © 2017年 陈宁. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,PISleftButtonType){
    PISleftButtonTypeHome = 0,
    PISleftButtonTypeFound,
    PISleftButtonTypeIcon,
    PISleftButtonTypeSina,
    PISleftButtonTypeWeiXin,
    PISleftButtonTypeMessage,
    PISleftButtonTypeSeting
};

@protocol PISLeftMenuViewDelegate <NSObject>

@optional

//左边按钮被点击时调用
-(void)leftMenuViewButtonClickFrom:(PISleftButtonType) formIndex to:(PISleftButtonType)toIndex;

//cictyBtn城市改变时调用
//-(void)leftMenuViewCictyButtonChange:(NSString *)citty;

@end

@interface PISLeftMenuView : UIView

@property (nonatomic, weak) id <PISLeftMenuViewDelegate> delegate;

-(void)coverIsRemove;

@end
