//
//  XJItemModelDic.h
//  EveryVideoDay
//
//  Created by qianfeng on 16/10/16.
//  Copyright © 2016年 一杯清火茶. All rights reserved.
//

#import "JSONModel.h"

@interface XJItemModelDic : JSONModel

//@property (nonatomic, copy) NSString * adTrack;
//@property (nonatomic, copy) NSString * author; // 注意
//@property (nonatomic, copy) NSString * campaign;
@property (nonatomic, copy) NSString * category;
@property (nonatomic, copy) NSString * collected;


@property (nonatomic, copy) NSString * collectionCount;
@property (nonatomic, copy) NSString * replyCount;
@property (nonatomic, copy) NSString * shareCount;


@property (nonatomic, copy) NSString * blurred;
@property (nonatomic, copy) NSString * detail; //图片
@property (nonatomic, copy) NSString * feed;
@property (nonatomic, copy) NSString * sharing;


@property (nonatomic, copy) NSString * dataType;
@property (nonatomic, copy) NSString * date;
@property (nonatomic, copy) NSString * Description; // 需要修改
@property (nonatomic, copy) NSString * duration;
//@property (nonatomic, copy) NSString * favoriteAdTrack;
@property (nonatomic, copy) NSString * ID; // 需要修改
@property (nonatomic, copy) NSString * idx;
//@property (nonatomic, copy) NSString * label;
//@property (nonatomic, copy) NSString * played;
// 省略了 playInfo数组
@property (nonatomic, copy) NSString * playUrl;
//@property (nonatomic, copy) NSString * promotion;
@property (nonatomic, copy) NSString * alias;
@property (nonatomic, copy) NSString * icon;
@property (nonatomic, copy) NSString * name;

@property (nonatomic, copy) NSString * releaseTime;
//@property (nonatomic, copy) NSString * shareAdTrack;
// 省略了 tags 数组
@property (nonatomic, copy) NSString * title;
@property (nonatomic, copy) NSString * Itemtype; //NORMAL
//@property (nonatomic, copy) NSString * waterMarks;
//@property (nonatomic, copy) NSString * webAdTrack;
@property (nonatomic, copy) NSString * forWeibo;
@property (nonatomic, copy) NSString * raw;
@property (nonatomic, copy) NSString * type; //  videoCollectionWithTitle


// 针对 author
@property (nonatomic, copy) NSString * author_description;
@property (nonatomic, copy) NSString * author_icon;
@property (nonatomic, copy) NSString * author_id;
@property (nonatomic, copy) NSString * author_latestReleaseTime;
@property (nonatomic, copy) NSString * author_link;
@property (nonatomic, copy) NSString * author_name;
@property (nonatomic, copy) NSString * author_videoNum;

// 针对 playInfo
@property (nonatomic, strong) NSMutableArray * playInfoArr;
// 针对tags
@property (nonatomic, strong) NSMutableArray * tagsArr;

@end











