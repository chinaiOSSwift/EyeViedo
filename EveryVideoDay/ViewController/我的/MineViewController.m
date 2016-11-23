//
//  MineViewController.m
//  EveryVideoDay
//
//  Created by MS on 16/10/11.
//  Copyright © 2016年 一杯清火茶. All rights reserved.
//

#import "MineViewController.h"
#import "XJData.h"
#import "XJManager.h"
#import "XJItemModelDic.h"
#import "XJDetailCell.h"
#import "MindDetailViewController.h"

@interface MineViewController ()

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(100, 200, 200, 100);
    btn.center = self.view.center;
    [btn setTitle:@"我的收藏" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
}



- (void)btnClick:(UIButton *)sender{
    MindDetailViewController *mvc = [[MindDetailViewController alloc] init];
    //XJManager *manager = [XJManager shareManager];
    mvc.array = [XJData selectNearbyAppsWithAppId];
    [self.navigationController pushViewController:mvc animated:YES];
    //[self presentViewController:mvc animated:YES completion:nil];
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
