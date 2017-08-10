//
//  PISHistoryCell.h
//  chengmi
//
//  Created by 陈宁 on 2017/8/10.
//  Copyright © 2017年 陈宁. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PISHistoryCell : UITableViewCell

/** 历史搜索文字 */
@property (weak, nonatomic) IBOutlet UILabel *hisTextLabel;

+(instancetype)historyCellWithTableView:(UITableView *)tableView IndexPath:(NSIndexPath *)indexPath atNSMutableArr:(NSMutableArray *)datas;

@end
