//
//  XJDetailCell.m
//  EveryVideoDay
//
//  Created by qianfeng on 16/10/17.
//  Copyright © 2016年 一杯清火茶. All rights reserved.
//

#import "XJDetailCell.h"
#import "XJData.h"
#import <UMSocialCore/UMSocialCore.h>
#import "UMSocialUIManager.h"

@implementation XJDetailCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.authorIcon.layer.masksToBounds = true;
    self.authorIcon.layer.cornerRadius = self.authorIcon.mj_h / 2;
    self.detailImage.userInteractionEnabled = true;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(playViedo:)];
    [self.detailImage addGestureRecognizer:tap];
}

- (void)playViedo:(UITapGestureRecognizer *)tap{
    // 创建 player
    AVPlayerItem * item = [AVPlayerItem playerItemWithURL:[NSURL URLWithString:self.playUrl]];
    AVPlayerViewController * pvc = [[AVPlayerViewController alloc]init];
    // 创建播放器
    AVQueuePlayer * player = [[AVQueuePlayer alloc]initWithItems:@[item]];
    pvc.player  = player;
    
    //代理传值
    [self.delegate presentPlayerController:pvc];
    
    
}



- (void)customWithXJItemModel:(XJItemModelDic *)model{
    modelA = model;
    UIButton *button = [[UIButton alloc] init];
    button.frame = CGRectMake(200, 300, 50, 50);
    [button setImage:[UIImage imageNamed:@"收藏5"] forState:UIControlStateNormal];
    [self.contentView addSubview:button];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *button1 = [[UIButton alloc] init];
    button1.frame = CGRectMake(270,300, 50, 50);
    [button1 setImage:[UIImage imageNamed:@"分享5"] forState:UIControlStateNormal];
    [self.contentView addSubview:button1];
    [button1 addTarget:self action:@selector(shareClick) forControlEvents:UIControlEventTouchUpInside];
    
    //model.playUrl = self.playUrl;
    [self.detailImage sd_setImageWithURL:[NSURL URLWithString:model.detail]];
    self.titleL.text = [NSString stringWithFormat:@"     %@",model.title];
    NSInteger min = model.duration.integerValue / 60; // 分钟
    NSInteger sec = model.duration.integerValue % 60; // 秒
    self.categoryL.text = [NSString stringWithFormat:@"     #%@   /  %.2ld'%.2ld''",model.category,min,sec];
    if(model.author_videoNum.integerValue != 0){
        [self.authorIcon sd_setImageWithURL:[NSURL URLWithString:model.author_icon]];
        self.authorName.text = model.author_name;
        self.authorViedoNum.text = [NSString stringWithFormat:@"%@个视频",model.author_videoNum];
        self.authorDes.text = model.author_description;
        
    }
    self.DesL.text = model.Description;
    self.collectionL.text = [NSString stringWithFormat:@"%ld",model.collectionCount.integerValue];
    self.shareL.text = [NSString stringWithFormat:@"%ld",model.shareCount.integerValue];
    self.replyL.text  = [NSString stringWithFormat:@"%ld",model.replyCount.integerValue];

}

- (void)buttonClick{
    if ([XJData isFavorited:modelA]) {
        
    }else{
        [XJData favoriteApp:modelA];
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
//    [UMSocialUIManager showShareMenuViewInView:nil sharePlatformSelectionBlock:^(UMSocialShareSelectionView *shareSelectionView, NSIndexPath *indexPath, UMSocialPlatformType platformType) {
//        [weakSelf disMissShareMenuView];
//        [weakSelf shareDataWithPlatform:platformType];
//        [self shareVedioToPlatformType:platformType];
//    }];
    
}


- (void)shareVedioToPlatformType:(UMSocialPlatformType)platformType
{
    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    
    //创建视频内容对象
    UMShareVideoObject *shareObject = [UMShareVideoObject shareObjectWithTitle:modelA.title descr:modelA.Description thumImage:[UIImage imageNamed:modelA.detail]];
    //设置视频网页播放地址
    shareObject.videoUrl = modelA.playUrl;
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



@end
