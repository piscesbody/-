//
//  PISViewController.m
//  chengmi
//
//  Created by 陈宁 on 2017/8/10.
//  Copyright © 2017年 陈宁. All rights reserved.
//  基类ViewController

#import "PISViewController.h"

#define PISScaleAnimateWithDuration 0.3

@interface PISViewController ()

@end

@implementation PISViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //添加导航条上的按钮

    self.view.backgroundColor = PISColor(239, 239, 244);
}

#pragma 导航条左右边按钮点击
-(void)rightClick
{
    _coverBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _coverBtn.frame = self.navigationController.view.bounds;
    [_coverBtn addTarget:self action:@selector(coverClick) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationController.view addSubview:_coverBtn];
    
    //缩放比例
    CGFloat zoomScale = (PISAppHeight - PISScaleTopMargin * 2) / PISAppHeight;
    CGFloat moveX = PISAppWidth - PISAppWidth * PISZoomScaleRight;
    
    [UIView animateWithDuration:PISScaleAnimateWithDuration animations:^{
        CGAffineTransform transform = CGAffineTransformMakeScale(zoomScale, zoomScale);
        //先缩放再位移会使位移缩水,正常需要moveX/zoomScale 才是正常的比例,这里感觉宽度还好就省略此步骤
        self.navigationController.view.transform = CGAffineTransformTranslate(transform, moveX, 0);
        //将状态改为已经缩放
        self.isScale = YES;
    }];
}

//推出search控制器

-(void)leftSearchClick
{
    
}

//cover点击
-(void)coverClick
{
    [UIView animateWithDuration:PISScaleAnimateWithDuration animations:^{
        self.navigationController.view.transform = CGAffineTransformIdentity;
    }completion:^(BOOL finished) {
        [self.coverBtn removeFromSuperview];
        self.coverBtn = nil;
        self.isScale = NO;
        //当遮盖按钮被销毁时调用
        if (_coverDidRemove) {
            _coverDidRemove();
        }
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
