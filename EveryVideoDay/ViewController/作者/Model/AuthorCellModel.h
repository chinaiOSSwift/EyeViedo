//
//  AuthorCellModel.h
//  EveryVideoDay
//
//  Created by MS on 16/10/18.
//  Copyright © 2016年 一杯清火茶. All rights reserved.
//

#import "JSONModel.h"

@interface AuthorCellModel : JSONModel

/****  itemList-Array  ***/

//以下数据用于展示 AuthorView 的cell
@property (nonatomic,copy) NSString * category;//#分类
@property (nonatomic,copy) NSString * Duration;//时间
@property (nonatomic,copy) NSString * title;//标题
@property (nonatomic,copy) NSString * iamge;//图片

////点击cell需要展示的数据  -- [author -Dictionary]
//@property (nonatomic,strong) NSMutableDictionary * author;//作者信息..
//@property (nonatomic,copy) NSString * Description;
//@property (nonatomic,copy) NSString * icon;
//@property (nonatomic,copy) NSString * Id;
@property (nonatomic,copy) NSString * latestReleaseTime;
//@property (nonatomic,copy) NSString * name;
@property (nonatomic,copy) NSString * videoNum;

//@property (nonatomic,strong) NSMutableDictionary * consumption;//分享..
@property (nonatomic,copy) NSString * cellId;
@property (nonatomic,copy) NSString * collectionCount;//喜欢
@property (nonatomic,copy) NSString * replyCount;//回复
@property (nonatomic,copy) NSString * shareCount;//分享

@property (nonatomic,strong) NSMutableDictionary * cover;//图片..
@property (nonatomic,copy) NSString * playUrl;//播放地址..
@property (nonatomic,copy) NSString * videoDescription;


/***  pgclnfo-Dictionary  ***/

//以下数据展示 pushCell 的头视图
@property (nonatomic,copy) NSString * actionUrl;
@property (nonatomic,copy) NSString * dataType;
@property (nonatomic,copy) NSString * Description;
@property (nonatomic,copy) NSString * icon;
@property (nonatomic,copy) NSString * Id;
@property (nonatomic,copy) NSString * name;

@end
