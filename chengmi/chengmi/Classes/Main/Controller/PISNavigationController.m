//
//  PISNavigationController.m
//  chengmi
//
//  Created by 陈宁 on 2017/8/10.
//  Copyright © 2017年 陈宁. All rights reserved.
//  基类导航控制器,定义了整个工程的UINavigationBar的主题

#import "PISNavigationController.h"

@interface PISNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation PISNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];

    //清空interactivePopGestureRecognizer的delegate,可以以恢复因替换导航条的back按钮失去系统默认手势
    self.interactivePopGestureRecognizer.delegate = nil;
    
    //禁止手势冲突
    self.interactivePopGestureRecognizer.enabled = NO;
    
    //在runtime中查到的系统tagert 和方法名 手动添加手势,调用系统的方法,这个警告看着不爽,直接强制去掉
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    UIGestureRecognizer *pan = [[UIGestureRecognizer alloc]initWithTarget:self.interactivePopGestureRecognizer.delegate action:@selector(handleNavigationTransition:)];
    
#pragma clang diagnositic pop
    pan.delegate = self;
    
    [self.view addGestureRecognizer:pan];
}

+(void)initialize
{
    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedIn:self, nil];
    [bar setBackgroundImage:[UIImage imageNamed:@"recomend_btn_gone"] forBarMetrics:UIBarMetricsDefault];
    
    //去掉导航条的半透明
    bar.translucent = NO;
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:20];
    dict[NSForegroundColorAttributeName] = [UIColor whiteColor];
    
    [bar setTitleTextAttributes:dict];
}

#pragma mark - 手势代理方法
//是否开始触发手势
-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    //判断下当前控制器是否是根控制器
    return (self.topViewController != [self.viewControllers firstObject]);
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
