//
//  TopicViewController.m
//  EveryVideoDay
//
//  Created by qianfeng on 16/10/18.
//  Copyright © 2016年 一杯清火茶. All rights reserved.
//

#import "TopicViewController.h"
#import "TopicCell.h"
#import "TopicModel.h"
#import "TopicModel+TopicManager.h"

@interface TopicViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation TopicViewController
-(NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [[NSMutableArray alloc]init];
    }
    return _dataArray;
}
-(UITableView *)tableView{
    if (!_tableView){
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H) style:(UITableViewStyleGrouped)];
        [_tableView registerNib:[UINib nibWithNibName:@"TopicCell" bundle:nil] forCellReuseIdentifier:@"TopicCell"];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 250;
        _tableView.autoresizesSubviews = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.showsVerticalScrollIndicator = NO;
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
}
-(void)loadData{
    [TopicModel requestTopicData:^(NSArray *array, NSError *error) {
        [self.dataArray addObject:array];
        [self.tableView reloadData];
    }];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray * array = self.dataArray[section];
    return [array count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellID = @"TopicCell";
    TopicCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    NSArray * array = self.dataArray[indexPath.section];
    TopicModel * model = array[indexPath.row];
    [cell.topicImage sd_setImageWithURL:[NSURL URLWithString:model.image]];
    return cell;
}

@end
