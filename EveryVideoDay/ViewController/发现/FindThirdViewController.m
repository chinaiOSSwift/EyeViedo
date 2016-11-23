//
//  FindThirdViewController.m
//  EveryVideoDay
//
//  Created by qianfeng on 16/10/15.
//  Copyright © 2016年 一杯清火茶. All rights reserved.
//

#import "FindThirdViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>
#import "XJData.h"
#import "XJManager.h"
#import "XJItemModelDic.h"
#import <UMSocialCore/UMSocialCore.h>
#import "UMSocialUIManager.h"

@interface FindThirdViewController ()

@end

@implementation FindThirdViewController
-(NSString *)FTCTitle{
    if(!_FTCTitle){
        _FTCTitle = [[NSString alloc]init];
    }
    return _FTCTitle;
}
-(NSString *)FTCCategory{
    if(!_FTCCategory){
        _FTCCategory = [[NSString alloc]init];
    }
    return _FTCCategory;
}
-(NSString *)FTCReleaseTime{
    if(!_FTCReleaseTime){
        _FTCReleaseTime = [[NSString alloc]init];
    }
    return _FTCReleaseTime;
}
-(NSString *)FTCDescription{
    if(!_FTCDescription){
        _FTCDescription = [[NSString alloc]init];
    }
    return _FTCDescription;
}
-(NSString *)FTCPlayUrl{
    if(!_FTCPlayUrl){
        _FTCPlayUrl = [[NSString alloc]init];
    }
    return _FTCPlayUrl;
}
-(NSString *)FTCblurred{
    if(!_FTCblurred){
        _FTCblurred = [[NSString alloc]init];
    }
    return _FTCblurred;
}
-(NSString *)FTCDetialview{
    if(!_FTCDetialview){
        _FTCDetialview = [[NSString alloc]init];
    }
    return _FTCDetialview;
}
-(NSMutableArray *)imageArray{
    if (!_imageArray){
        _imageArray = [[NSMutableArray alloc]init];
    }
    return _imageArray;
}
-(NSMutableArray *)dataArray{
    if (!_dataArray){
        _dataArray = [[NSMutableArray alloc]init];
    }
    return _dataArray;
}-(NSMutableArray *)webArray{
    if (!_webArray){
        _webArray = [[NSMutableArray alloc]init];
    }
    return _webArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [_BlurredImage sd_setImageWithURL:[NSURL URLWithString:_FTCblurred]];
    [_DetialView sd_setImageWithURL:[NSURL URLWithString:_FTCDetialview]];
    _titleLabel.text = _FTCTitle;
    _categoryLabel.text = _FTCCategory;
    _releaseTimeLable.text = _FTCReleaseTime;
    _descriptionLabel.text = _FTCDescription;
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
    model.ID = self.FTCPlayUrl;
    model.playUrl = self.FTCPlayUrl;
    model.title = self.FTCTitle;
    model.Description = self.FTCDescription;
    model.detail = _FTCDetialview;
    if ([XJData isFavorited:model]) {
        
    }else{
        [XJData favoriteApp:model];
    }
    
    NSArray *array = [XJData selectNearbyAppsWithAppId];
    NSLog(@"%ld",array.count);
}

- (void)shareClick{
//    [UMSocialUIManager showShareMenuViewInWindowWithPlatformSelectionBlock:^(UMShareMenuSelectionView *shareSelectionView, UMSocialPlatformType platformType) {
//    <#code#>
//}]

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
    UMShareVideoObject *shareObject = [UMShareVideoObject shareObjectWithTitle:self.FTCTitle descr:self.FTCDescription thumImage:[UIImage imageNamed:_FTCDetialview]];
    //设置视频网页播放地址
    shareObject.videoUrl = self.FTCPlayUrl;
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



- (IBAction)PlayBtn:(UIButton *)sender {
    AVPlayerViewController *playerVC = [[AVPlayerViewController alloc]init];
    playerVC.player = [[AVPlayer alloc]initWithURL:[NSURL URLWithString:_FTCPlayUrl]];
    [self.navigationController presentViewController:playerVC animated:true completion:^{
        [playerVC.player play];
    }];
}


@end
