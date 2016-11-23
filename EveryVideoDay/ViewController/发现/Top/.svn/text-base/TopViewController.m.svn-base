//
//  TopViewController.m
//  EveryVideoDay
//
//  Created by qianfeng on 16/10/18.
//  Copyright © 2016年 一杯清火茶. All rights reserved.
//

#import "TopViewController.h"
#import "TopModel.h"
#import "TopCell.h"
#import "TopModel+TopManager.h"
#import "FindThirdViewController.h"

@interface TopViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation TopViewController
-(NSMutableArray *)imageArray{
    if(!_imageArray){
        _imageArray = [[NSMutableArray alloc]init];
    }
    return  _imageArray;
}

-(NSMutableArray *)dataArray{
    if (!_dataArray){
        _dataArray = [[NSMutableArray alloc]init];
    }
    return _dataArray;
}

-(NSMutableArray *)webArray{
    if (!_webArray){
        _webArray = [[NSMutableArray alloc]init];
    }
    return _webArray;
}

-(UITableView *)tableView{
    if (!_tableView){
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H) style:(UITableViewStyleGrouped)];
        [_tableView registerNib:[UINib nibWithNibName:@"TopCell" bundle:nil] forCellReuseIdentifier:@"TopCell"];
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
    self.view.backgroundColor = [UIColor whiteColor];
    [self loadData];
}
-(void)loadData{
    [TopModel requestTopData:^(NSArray *array, NSArray *imageArray, NSArray *webArray, NSError *error) {

        [self.dataArray addObject:array];
        [self.imageArray addObject:imageArray];
        [self.tableView reloadData];
    }];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray * array = self.dataArray[section];
    return [array count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellID = @"TopCell";
    TopCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    NSArray * array = self.dataArray[indexPath.section];
    TopModel * model = array[indexPath.row];
    NSArray * array1 = self.imageArray[indexPath.section];
    TopModel * model1 = array1[indexPath.row];
    [cell.topImage sd_setImageWithURL:[NSURL URLWithString:model1.feed]];
    cell.topTitle.text = model.title;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    FindThirdViewController * FTC = [[FindThirdViewController alloc]init];
    FTC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:FTC animated:YES];
    NSArray * array = self.dataArray[indexPath.section];
    TopModel * model = array[indexPath.row];
    NSArray * array1 = self.imageArray[indexPath.section];
    TopModel * model1 = array1[indexPath.row];
    FTC.FTCDetialview = model1.feed;
    FTC.FTCTitle = model.title;
    FTC.FTCCategory = model.category;
    FTC.FTCReleaseTime = model.releaseTime;
    FTC.FTCPlayUrl = model.playUrl;
    FTC.FTCblurred = model1.blurred;
    FTC.FTCDescription = model.Description;
}

@end
