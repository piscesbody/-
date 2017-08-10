//
//  PISSearchViewController.m
//  chengmi
//
//  Created by 陈宁 on 2017/8/10.
//  Copyright © 2017年 陈宁. All rights reserved.
//  搜索控制器 历史数组数据直接写入的caches文件中的hisDatas中

#import "PISSearchViewController.h"
#import "PISSearchTextField.h"
#import "PISSearchHeadView.h"
#import "PISHistoryCell.h"
#import "PISHotCell.h"

//历史搜索记录的文件路径
#define PISSearchHistoryPath [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)lastObject]stringByAppendingPathComponent:@"hisDatas.data"]

@interface PISSearchViewController () <UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>

/** 搜索文本框 */
@property (nonatomic, weak) PISSearchTextField *searchTF;
/** 搜索的tableView */
@property (nonatomic, strong) UITableView *tableView;
/** 搜索的数据 */
@property (nonatomic, strong) NSMutableArray *datas;
/** 历史搜索数据 */
@property (nonatomic, strong) NSMutableArray *hisDatas;
/** 热门数据模型 */
@property (nonatomic, strong) NSArray *hotDatas;

@end

@implementation PISSearchViewController

-(void)test
{
    [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)lastObject]stringByAppendingPathComponent:@"hisDatas.data"];
}

-(NSMutableArray *)hisDatas
{
    if (_hisDatas == nil) {
        _hisDatas = [NSMutableArray arrayWithContentsOfFile:PISSearchHistoryPath];
        if (_hisDatas == nil) {
            _hisDatas = [NSMutableArray arrayWithObjects:@"优衣库", nil];
        }
    }
    return _hisDatas;
}

-(NSArray *)hotDatas
{
    if (_hotDatas == nil) {
        _hotDatas = @[@"下午茶",@"火锅",@"温泉",@"杭州"];
    }
    return _hotDatas;
}

/** 模拟数据,懒加载方法 */

-(NSMutableArray *)datas
{
    if (_datas == nil) {
        _datas = [NSMutableArray array];
        
        if (self.hisDatas.count) {
            [_datas addObject:self.hisDatas];
        }
        
        //热点搜索.估计服务器每次返回四个字符串
        [_datas addObject:self.hisDatas];
    }
    return _datas;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //初始化导航条内容
    
    
    //初始化UI
    
    
}

-(void)viewDidAppear:(BOOL)animated
{
    //文本框获取焦点
    [super viewDidAppear:animated];
    [self.searchTF becomeFirstResponder];
}

-(void)setNavigationItem
{
    //搜索TextField
    PISSearchTextField *search = [[PISSearchTextField alloc]init];
    CGFloat w = PISAppWidth * 0.7;
    search.frame = CGRectMake(0, 0, w, 30);
    search.delegate = self;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:search];
    self.searchTF = search;
    
    //取消按钮
    UIBarButtonItem *rightItem = [UIBarButtonItem initWithTitle:@"取消" titleColor:[UIColor whiteColor] target:self action:@selector(backClick)];
    self.navigationItem.rightBarButtonItem = rightItem;
}

-(void)setUI
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    [self.view addSubview:self.tableView];
    
}
-(void)backClick
{
    [self.view endEditing:YES];
    [self.navigationController popViewControllerAnimated:YES];
}

//监听手机键盘点击搜索的事件
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    //判断是否有输入,有值的话将新的字符串添加到datas[0]中并且重新写入文件,发送网络请求
    /* 发送请求 */
    PISLog(@"发送请求");
    if (textField.text.length) {
        for (NSString *text in self.hisDatas) {
            if ([text isEqualToString:textField.text]) {
                return YES;
            }
        }
        [self.hisDatas insertObject:textField.text atIndex:0];
        [self.hisDatas writeToFile:PISSearchHistoryPath atomically:YES];
        [self.tableView reloadData];
        textField.text = @"";
    }
    return YES;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //点击屏幕搜索框失去焦点
    [self.searchTF resignFirstResponder];
}

#pragma mark - UITableViewDataSource UITableViewDelegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.datas.count == 2) {
        if (section == 0) {
            return [self.datas[0] count];
        }else{
            return 1;
        }
    }else{
        return 1;
    }
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
//    PISLog(@"%zd",self.hisDatas.count);
//    if (self.hisDatas.count) {
//        return 1;
//    }else{
//        return 0;
//    }
//    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.datas.count == 2 && indexPath.section == 0 && self.hisDatas.count) {
        PISHistoryCell *cell = [PISHistoryCell historyCellWithTableView:tableView IndexPath:indexPath atNSMutableArr:self.hisDatas];
        cell.hisTextLabel.text = self.datas[0][indexPath.row];
        return cell;
    }else{
        //这里就一个cell 不用注册了
        PISHotCell *cell = [PISHotCell hotCellWithHotDatas:self.hotDatas];
        return cell;
    }
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    //注册head的方法和cell差不多
    PISSearchHeadView *head = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"head"];
    if (head == nil) {
        head = [PISSearchHeadView headView];
    }
    
    if (self.hisDatas.count) {
        if (section == 0) {
            head.headTextLabel.text = @"历史";
            return head;
        }else{
            head.headTextLabel.text = @"热门";
            return head;
        }
    }else{
        head.headTextLabel.text = @"热门";
        return head;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
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
