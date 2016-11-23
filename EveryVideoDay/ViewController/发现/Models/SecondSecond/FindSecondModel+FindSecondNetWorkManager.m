//
//  FindSecondModel+FindSecondNetWorkManager.m
//  EveryVideoDay
//
//  Created by qianfeng on 16/10/15.
//  Copyright © 2016年 一杯清火茶. All rights reserved.
//

#import "FindSecondModel+FindSecondNetWorkManager.h"

@implementation FindSecondModel (FindSecondNetWorkManager)


+(void)requestFindSecondData:(NSString *)categoryId callBack:(void (^)(NSArray *, NSArray *, NSArray *, NSError *))callBack{
    NSDictionary * para = @{@"categoryId":categoryId};
    NSString * URL = @"http://baobab.wandoujia.com/api/v3/videos";
    [BaseRequest getWithURL:URL para:para calBack:^(NSData *data, NSError *error) {
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
            NSMutableArray * touchArray = [FindSecondModel arrayOfModelsFromDictionaries:touchArr error:nil];
            NSMutableArray * imageArray = [FindSecondModel arrayOfModelsFromDictionaries:imageArr error:nil];
            NSMutableArray * webArray = [FindSecondModel arrayOfModelsFromDictionaries:webArr error:nil];
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
