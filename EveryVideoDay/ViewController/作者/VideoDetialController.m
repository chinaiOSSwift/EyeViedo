//
//  VideoDetialController.m
//  EveryVideoDay
//
//  Created by MS on 16/10/19.
//  Copyright © 2016年 一杯清火茶. All rights reserved.
//

#import "VideoDetialController.h"

#import <AVFoundation/AVFoundation.h>

#import <AVKit/AVKit.h>
#import <MediaPlayer/MPMoviePlayerViewController.h>
#import "AuthorView.h"
#import <MediaPlayer/MediaPlayer.h>
#import "XJData.h"
#import "XJManager.h"
#import "XJItemModelDic.h"
#import <UMSocialCore/UMSocialCore.h>
#import "UMSocialUIManager.h"
@interface VideoDetialController ()

@end



@implementation VideoDetialController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBarController.tabBar.hidden = YES;
    self.navigationController.navigationBar.hidden = YES;
    [self loadData];
}

-(void)loadData{
    [self.coverDetail sd_setImageWithURL:[NSURL URLWithString:self.cover]];//大图
    self.cellTitle.text = self.cell_title;// title
    self.cellCategory.text = self.cell_category;
    self.cellDuration.text = self.cell_duration;
    [self.authorIcon sd_setImageWithURL:[NSURL URLWithString:self.author_icon]];
    self.authorIcon.layer.cornerRadius = self.authorIcon.mj_h / 2;
    self.authorIcon.clipsToBounds = YES;
    self.authorName.text = self.author_name;

    self.authorVideoNum.text = [NSString stringWithFormat:@"%@",self.author_videonum];
    self.authorDetail.text = self.author_detail;
    self.videoDetail.text = self.video_detail;//详细介绍
    self.likeNum.text = [NSString stringWithFormat:@"%@",self.like_num];
    // cell.duration.text = [NSString stringWithFormat:@"%@",model.Duration];

   self.shareNum.text = [NSString stringWithFormat:@"%@",self.share_num];
    self.pinglunNum.text = [NSString stringWithFormat:@"%@",self.pinglun_num];
    UIButton *button = [[UIButton alloc] init];
    button.frame = CGRectMake(200, 300, 50, 50);
    [button setImage:[UIImage imageNamed:@"收藏5"] forState:UIControlStateNormal];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(collectClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *button1 = [[UIButton alloc] init];
    button1.frame = CGRectMake(270, 300, 50, 50);
    [button1 setImage:[UIImage imageNamed:@"分享5"] forState:UIControlStateNormal];
    [self.view addSubview:button1];
    [button1 addTarget:self action:@selector(shareClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)collectClick{
    XJItemModelDic *model = [[XJItemModelDic alloc] init];
    model.ID = self.playUrl;
    model.playUrl = self.playUrl;
    model.title = self.title;
    model.Description = self.video_detail;
    model.detail = self.cover;
    if ([XJData isFavorited:model]) {
        
    }else{
        [XJData favoriteApp:model];
    }
    
    NSArray *array = [XJData selectNearbyAppsWithAppId];
    NSLog(@"%ld",array.count);
}

- (void)shareClick{
    
    //显示分享面板
    __weak typeof(self) weakSelf = self;
    //显示分享面板
    [UMSocialUIManager showShareMenuViewInWindowWithPlatformSelectionBlock:^(UMShareMenuSelectionView *shareSelectionView, UMSocialPlatformType platformType) {
        [weakSelf shareVedioToPlatformType:platformType];
    }];
    
}

- (void)shareVedioToPlatformType:(UMSocialPlatformType)platformType
{
    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    
    //创建视频内容对象
    UMShareVideoObject *shareObject = [UMShareVideoObject shareObjectWithTitle:self.title descr:self.video_detail thumImage:[UIImage imageNamed:self.cover]];
    //设置视频网页播放地址
    shareObject.videoUrl = self.playUrl;
    //            shareObject.videoStreamUrl = @"这里设置视频数据流地址（如果有的话，而且也要看所分享的平台支不支持）";
    
    //分享消息对象设置分享内容对象
    messageObject.shareObject = shareObject;
    
    //调用分享接口
    [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:self completion:^(id data, NSError *error) {
        if (error) {
            NSLog(@"************Share fail with error %@*********",error);
        }else{
            NSLog(@"response data is %@",data);
        }
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)videoBtn:(UIButton *)sender {
    
    NSURL * videoUrl = [NSURL URLWithString:self.playUrl];//网址
    MPMoviePlayerViewController * videoVc = [[MPMoviePlayerViewController alloc]initWithContentURL:videoUrl];
    [self presentMoviePlayerViewControllerAnimated:videoVc];
    
}

- (IBAction)fanHui:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
