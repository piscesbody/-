//
//  PISHistoryCell.m
//  chengmi
//
//  Created by 陈宁 on 2017/8/10.
//  Copyright © 2017年 陈宁. All rights reserved.
//  搜索历史tableView的cell,每次操作需要持久化存储数据

#import "PISHistoryCell.h"

@interface PISHistoryCell()

//历史搜索记录的文件路径
#define PISSearchHistoryPath [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)lastObject]stringByAppendingPathComponent:@"hisDatas.data"]

/** 底部的线 */
@property (weak, nonatomic) IBOutlet UIView *bottomLineView;

/** 记录自己是哪个数据 */
@property (nonatomic, weak) NSIndexPath *indexPath;
/** 记录模型数据 */
@property (nonatomic, weak) NSMutableArray *hisDatas;
/** 记录tableView */
@property (nonatomic, weak) UITableView *tableView;

@end

@implementation PISHistoryCell



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}
- (IBAction)deleteButtonClick:(UIButton *)sender
{
    [self.hisDatas removeObjectAtIndex:self.indexPath.row];
    [self.hisDatas writeToFile:PISSearchHistoryPath atomically:YES];
    [self.tableView deleteRowsAtIndexPaths:@[self.indexPath] withRowAnimation:UITableViewRowAnimationLeft];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
}

+(instancetype)historyCellWithTableView:(UITableView *)tableView IndexPath:(NSIndexPath *)indexPath atNSMutableArr:(NSMutableArray *)datas
{
    static NSString *identifier = @"historyCell";
    PISHistoryCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil]lastObject];
    }
    cell.tableView = tableView;
    cell.hisDatas = datas;
    cell.indexPath = indexPath;
    
    return cell;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
