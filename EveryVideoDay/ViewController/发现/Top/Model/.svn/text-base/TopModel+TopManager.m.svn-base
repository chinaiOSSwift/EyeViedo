//
//  TopModel+TopManager.m
//  EveryVideoDay
//
//  Created by qianfeng on 16/10/18.
//  Copyright © 2016年 一杯清火茶. All rights reserved.
//

#import "TopModel+TopManager.h"

@implementation TopModel (TopManager)
+(void)requestTopData:(void (^)(NSArray *, NSArray *, NSArray *, NSError *))callBack{
    NSString * URL = @"http://baobab.wandoujia.com/api/v3/ranklist?strategy=historical";
    [BaseRequest getWithURL:URL para:nil calBack:^(NSData *data, NSError *error) {
        if (error == nil) {
            NSDictionary * obj = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
            NSArray * itemListArray = obj[@"itemList"];
            NSMutableArray * touchArr = [[NSMutableArray alloc]init];
            NSMutableArray * imageArr = [[NSMutableArray alloc]init];
            NSMutableArray * webArr = [[NSMutableArray alloc]init];
            for (NSDictionary * i in itemListArray){
                NSDictionary * data = i[@"data"];
                [touchArr addObject:data];
                NSDictionary * a = data[@"cover"];
                [imageArr addObject:a];
                NSDictionary * b = data[@"webUrl"];
                [webArr addObject:b];
            }
            NSMutableArray * touchArray = [TopModel arrayOfModelsFromDictionaries:touchArr error:nil];
            NSMutableArray * imageArray = [TopModel arrayOfModelsFromDictionaries:imageArr error:nil];
            NSMutableArray * webArray = [TopModel arrayOfModelsFromDictionaries:webArr error:nil];
            dispatch_async(dispatch_get_main_queue(), ^{
                callBack(touchArray, imageArray, webArray, nil);
            });
        }else{
            dispatch_async(dispatch_get_main_queue(), ^{
                callBack(nil, nil, nil, error);
            });
        }
    }];
}
@end
