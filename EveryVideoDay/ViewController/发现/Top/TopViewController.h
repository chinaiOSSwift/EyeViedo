//
//  TopViewController.h
//  EveryVideoDay
//
//  Created by qianfeng on 16/10/18.
//  Copyright © 2016年 一杯清火茶. All rights reserved.
//

#import "BaseViewController.h"

@interface TopViewController : BaseViewController
@property (nonatomic, strong) NSMutableArray * imageArray;
@property (nonatomic, strong) NSMutableArray * dataArray;
@property (nonatomic, strong) NSMutableArray * webArray;
@property (nonatomic, strong) UITableView * tableView;

@end
