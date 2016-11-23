//
//  AllDataModel.h
//  EveryVideoDay
//
//  Created by MS on 16/10/15.
//  Copyright © 2016年 一杯清火茶. All rights reserved.
//

#import "JSONModel.h"

@interface AllDataModel : JSONModel

/* 左标题数据 */
@property (nonatomic,copy) NSString * text;

/* 所有cell的共有数据，其中在type-videoCollectionWithBrief 下面数据在data[@"header"]内 */
@property (nonatomic,copy) NSString * Description;//cell描述   collection推进去的简介
@property (nonatomic,copy) NSString * actionUrl;


@property (nonatomic,copy) NSString * dataType;

@property (nonatomic,copy) NSString * icon;//头像
@property (nonatomic,copy) NSString * Id;//id
@property (nonatomic,copy) NSString * subTitle;//副标题 n个视频
@property (nonatomic,copy) NSString * title;//作者名   collection也用到

//
@property (nonatomic,copy) NSString * vTitle;

/* videoCollectionWithBrief 特有数据 */
@property (nonatomic,copy) NSString * count;//data[@"count"] = n，说明data[@"itemList"]就有多少数据
@property (nonatomic,copy) NSString * category;//#分类
@property (nonatomic,copy) NSString * duration;//时间
//在author 中
@property (nonatomic,copy) NSString * name;//
@property (nonatomic,copy) NSString * videoNum;//视频个数

@property (nonatomic,copy) NSString * playUrl;//播放网址
//在consumption 中
@property (nonatomic,copy) NSString * collectionCount;//收藏个数
@property (nonatomic,copy) NSString * replyCount;//评论个数
@property (nonatomic,copy) NSString * shareCount;//分享个数

//cover中图片
@property (nonatomic,copy) NSString * detail;//

@property (nonatomic,copy) NSMutableArray *itemList;//collectionView的数据

//collectionView


@end
