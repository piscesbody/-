//
//  PISViewController.h
//  chengmi
//
//  Created by 陈宁 on 2017/8/10.
//  Copyright © 2017年 陈宁. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^coverDidRomove)();

@interface PISViewController : UIViewController

/** 遮盖按钮 */
@property (nonatomic, strong) UIButton *coverBtn;

@property (nonatomic, strong) coverDidRomove coverDidRemove;

@property (nonatomic, assign) BOOL isScale;

-(void)coverClick;

/** 点击缩放按钮 */
-(void)rightClick;

@end
