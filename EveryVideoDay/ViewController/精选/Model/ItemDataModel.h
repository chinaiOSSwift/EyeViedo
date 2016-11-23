//
//  ItemDataModel.h
//  EveryVideoDay
//
//  Created by qianfeng on 16/10/13.
//  Copyright © 2016年 一杯清火茶. All rights reserved.
//

#import "JSONModel.h"
#import "AuthorModel.h"
#import "ConsumptionModel.h"
#import "CoverModel.h"
#import "PlayInfoModel.h"
#import "ProviderModel.h"
#import "TagModel.h"
#import "WebUrlModel.h"
@interface ItemDataModel : JSONModel

@property (nonatomic,copy) NSString * adTrack;
@property (nonatomic,copy) AuthorModel * authorModel; // 作者
@property (nonatomic,copy) NSString * campaign;
@property (nonatomic,copy) NSString * category;
@property (nonatomic,copy) NSString * collected;
@property (nonatomic,copy) ConsumptionModel * consumptionModel; // 收藏,分享,播放
@property (nonatomic,copy) CoverModel * coverModel; // 封面
@property (nonatomic,copy) NSString * dataType;
@property (nonatomic,copy) NSString * date;
@property (nonatomic,copy) NSString * Description; // 注意
@property (nonatomic,copy) NSString * duration;
@property (nonatomic,copy) NSString * favoriteAdTrack;
@property (nonatomic,copy) NSString * ID; // 注意
@property (nonatomic,copy) NSString * idx;
@property (nonatomic,copy) NSString * label;
@property (nonatomic,copy) NSString * played;
@property (nonatomic,copy) NSMutableArray * playInfoModel; // 标清 高清
@property (nonatomic,copy) ProviderModel * providerModel; // 提供者信息
@property (nonatomic,copy) NSString * playUrl;
@property (nonatomic,copy) NSString * releaseTime;
@property (nonatomic,copy) NSString * shareAdTrack;
@property (nonatomic,copy) NSMutableArray * tagModel; // 标签数组
@property (nonatomic,copy) NSString * title;
@property (nonatomic,copy) NSString * type;
@property (nonatomic,copy) NSString * waterMarks;
@property (nonatomic,copy) NSString * webAdTrack;
@property (nonatomic,copy) WebUrlModel * webModel; // webUrl 分享

// 第一张图片
@property (nonatomic,copy) NSString * actionUrl;
@property (nonatomic,copy) NSString * shade;
@property (nonatomic,copy) NSString * image;

/*
 @property (nonatomic,copy) NSString * adTrack;
 @property (nonatomic,copy) NSString * dataType;
 @property (nonatomic,copy) NSString * Description; // 注意
 @property (nonatomic,copy) NSString * ID; // 注意
 @property (nonatomic,copy) NSString * title;
 */

@end
























