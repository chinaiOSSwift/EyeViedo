//
//  MindDetailViewController.m
//  EveryVideoDay
//
//  Created by qianfeng on 16/10/19.
//  Copyright © 2016年 一杯清火茶. All rights reserved.
//

#import "MindDetailViewController.h"
#import "XJItemModelDic.h"
#import "XJData.h"
#import "MineTableViewCell.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVPlayerViewController.h>

@interface MindDetailViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation MindDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_W, SCREEN_H - 64- 49) style:UITableViewStylePlain];
    tableView.tag = 1;
    [tableView registerClass:[MineTableViewCell class] forCellReuseIdentifier:@"MineTableViewCell"];
    tableView.delegate = self;
    tableView.dataSource = self;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"清空5"] style:UIBarButtonItemStyleDone target:self action:@selector(barClick)];
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    [self.view addSubview:tableView];
//    [tableView reloadData];
}

- (void)viewWillAppear:(BOOL)animated{
    self.array = [XJData selectNearbyAppsWithAppId];
    UITableView *tableView = [self.view viewWithTag:1];
    [tableView reloadData];
}

- (void)barClick{
    BOOL qwe = [XJData removeAll:self.array];
    if (qwe) {
        self.array = [XJData selectNearbyAppsWithAppId];
        UITableView *tableView = [self.view viewWithTag:1];
        [tableView reloadData];
    }
    //[self.navigationController popViewControllerAnimated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.array.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"删除";
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    BOOL qwe = [XJData removeApp:self.array[indexPath.row]];
    if (qwe) {
        [self.array removeObjectAtIndex:indexPath.row];
        [tableView reloadData];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //MineTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MineTableViewCell" forIndexPath:indexPath];
    MineTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MineTableViewCell"];
    if (!cell) {
        cell = [[MineTableViewCell alloc] init];
    }
    XJItemModelDic *model = self.array[indexPath.row];
    [cell custom:model];

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    XJItemModelDic *model = self.array[indexPath.row];
    NSLog(@"%@",model.playUrl);
    AVPlayerItem * item = [AVPlayerItem playerItemWithURL:[NSURL URLWithString:model.playUrl]];
    AVPlayerViewController * pvc = [[AVPlayerViewController alloc]init];
    // 创建播放器
    AVQueuePlayer * player = [[AVQueuePlayer alloc]initWithItems:@[item]];
    pvc.player  = player;
    pvc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:pvc animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
