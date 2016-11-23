//
//  XJItemModelDic.m
//  EveryVideoDay
//
//  Created by qianfeng on 16/10/16.
//  Copyright © 2016年 一杯清火茶. All rights reserved.
//

#import "XJItemModelDic.h"
#import "PlayInfoModel.h"
#import "TagModel.h"

@implementation XJItemModelDic

+(BOOL)propertyIsOptional:(NSString *)propertyName{
    //    NSLog(@"XJItemModelDic 最里层的model - %@",propertyName);
    return true;
}

+ (JSONKeyMapper *)keyMapper{
    return [[JSONKeyMapper alloc]initWithModelToJSONDictionary:@{@"ID":@"id",@"Description":@"description",@"Itemtype":@"type"}];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict error:(NSError *__autoreleasing *)err{
    if (self = [super initWithDictionary:dict error:err]){
        
        self.type = dict[@"type"];
        //        self.adTrack = dict[@"data"][@"adTrack"];
        //        self.campaign = dict[@"data"][@"campaign"];
        self.category = dict[@"data"][@"category"];
        self.collected = dict[@"data"][@"collected"];
        
        self.collectionCount = dict[@"data"][@"consumption"][@"collectionCount"];
        self.replyCount = dict[@"data"][@"consumption"][@"replyCount"];
        self.shareCount = dict[@"data"][@"consumption"][@"shareCount"];
        
        
        self.blurred = dict[@"data"][@"cover"][@"blurred"];
        self.detail = dict[@"data"][@"cover"][@"detail"];
        self.feed = dict[@"data"][@"cover"][@"feed"];
//        self.sharing = dict[@"data"][@"cover"][@"sharing"];
        
        self.dataType = dict[@"data"][@"dataType"];
        self.date = dict[@"data"][@"date"];
        self.Description = dict[@"data"][@"description"];
        self.duration = dict[@"data"][@"duration"];
        //        self.favoriteAdTrack = dict[@"data"][@"favoriteAdTrack"];
        self.ID = dict[@"data"][@"id"];
        self.idx = dict[@"data"][@"idx"];
        //        self.label = dict[@"data"][@"label"];
//        self.played = dict[@"data"][@"played"];
        self.playUrl = dict[@"data"][@"playUrl"];
        //        self.promotion = dict[@"data"][@"promotion"];
        
        
        self.alias = dict[@"data"][@"provider"][@"alias"];
        self.icon = dict[@"data"][@"provider"][@"icon"];
        self.name = dict[@"data"][@"provider"][@"name"];
        
        self.releaseTime = dict[@"data"][@"releaseTime"];
        //        self.shareAdTrack = dict[@"data"][@"shareAdTrack"];
        
        self.title = dict[@"data"][@"title"];
        self.type = dict[@"data"][@"type"];
        //        self.waterMarks = dict[@"data"][@"waterMarks"];
        //        self.webAdTrack = dict[@"data"][@"webAdTrack"];
        
        
        self.forWeibo = dict[@"data"][@"webUrl"][@"forWeibo"];
        self.raw = dict[@"data"][@"webUrl"][@"raw"];
        
        
        //        NSLog(@"title:%@, playUrl - %@", self.title, self.playUrl);
        
        //
        /*
         @property (nonatomic, copy) NSString * author_description;
         @property (nonatomic, copy) NSString * author_icon;
         @property (nonatomic, copy) NSString * author_id;
         @property (nonatomic, copy) NSString * author_latestReleaseTime;
         @property (nonatomic, copy) NSString * author_link;
         @property (nonatomic, copy) NSString * author_name;
         @property (nonatomic, copy) NSString * author_videoNum;
         */
        NSDictionary * author = dict[@"data"][@"author"];
        if (author != [NSNull null]){
            self.author_description = dict[@"data"][@"author"][@"description"];
            self.author_icon = dict[@"data"][@"author"][@"icon"];
            self.author_id = dict[@"data"][@"author"][@"id"];
            self.author_link = dict[@"data"][@"author"][@"link"];
            self.author_latestReleaseTime = dict[@"data"][@"author"][@"latestReleaseTime"];
            self.author_name = dict[@"data"][@"author"][@"name"];
            self.author_videoNum = dict[@"data"][@"author"][@"videoNum"];
        }
        
        NSError * error = nil;
        self.tagsArr = nil;
        NSMutableArray * tagsArray = dict[@"data"][@"tags"];
        if (tagsArray.count > 0){
            self.tagsArr = [TagModel arrayOfModelsFromDictionaries:tagsArray error:&error];
        }
        self.playInfoArr = nil;
        NSMutableArray * playInfoArray = dict[@"data"][@"playInfo"];
        if (playInfoArray.count != [NSNull null]){
            self.playInfoArr = [PlayInfoModel arrayOfModelsFromDictionaries:playInfoArray error:&error];
        }
        
    }
    return self;
}


@end
