//
//  TopicModel+TopicManager.m
//  EveryVideoDay
//
//  Created by qianfeng on 16/10/18.
//  Copyright © 2016年 一杯清火茶. All rights reserved.
//

#import "TopicModel+TopicManager.h"

@implementation TopicModel (TopicManager)
+(void)requestTopicData:(void (^)(NSArray *, NSError *))callBack{
    NSString *URL = @"http://baobab.wandoujia.com/api/v3/specialTopics?start=0&num=40";
    [BaseRequest getWithURL:URL para:nil calBack:^(NSData *data, NSError *error) {
        if (!error){
            NSDictionary * obj = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
            NSArray * itemListArray = obj[@"itemList"];
            NSMutableArray * dataArr = [[NSMutableArray alloc]init];
            for (NSDictionary * i in itemListArray){
                NSDictionary * data = i[@"data"];
                [dataArr addObject:data];
            }
            NSMutableArray * dataArray = [TopicModel arrayOfModelsFromDictionaries:dataArr error:nil];
            dispatch_async(dispatch_get_main_queue(), ^{
                callBack(dataArray,nil);
            });
        }else{
            callBack(nil,error);
        }
    }];
}

@end
