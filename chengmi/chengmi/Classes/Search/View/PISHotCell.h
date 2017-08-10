//
//  PISHotCell.h
//  chengmi
//
//  Created by 陈宁 on 2017/8/10.
//  Copyright © 2017年 陈宁. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PISHotCell : UITableViewCell

/** 热门BTN的titles */
@property (nonatomic, strong) NSArray *hotDatas;

+(instancetype)hotCellWithHotDatas:(NSArray *)hotDatas;

@end
