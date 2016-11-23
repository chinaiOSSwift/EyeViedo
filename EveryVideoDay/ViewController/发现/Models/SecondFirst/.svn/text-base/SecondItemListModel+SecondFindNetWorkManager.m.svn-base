//
//  SecondItemListModel+SecondFindNetWorkManager.m
//  EveryVideoDay
//
//  Created by qianfeng on 16/10/14.
//  Copyright © 2016年 一杯清火茶. All rights reserved.
//

#import "SecondItemListModel+SecondFindNetWorkManager.h"

@implementation SecondItemListModel (SecondFindNetWorkManager)

+(void)requestFindSecondItemListData:(void (^)(NSArray *, NSError *))callBack{
        NSString * URL = @"http://baobab.wandoujia.com/api/v3/discovery?_s=f5b9d52f32b1afa3c1c09a536c8effa4&f=iphone&net=wifi&u=843e5559476fa559a979a5ed6bee2a88e115cb27&v=2.6.0&vc=1209";
    
    [BaseRequest getWithURL:URL para:nil calBack:^(NSData *data, NSError *error) {
        if (!error){
            NSDictionary * obj = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
            NSArray * itemListArr = obj[@"itemList"];
            NSMutableArray * bannerArray = [[NSMutableArray alloc]init];
            NSMutableArray * imageArr = [[NSMutableArray alloc]init];
            for (NSDictionary * i in itemListArr) {
                NSDictionary * bannerDic = itemListArr[0];
                NSDictionary * data = [bannerDic objectForKey:@"data"];
                NSArray * a = [data objectForKey:@"itemList"];
                for (NSDictionary * m in a) {
                    NSDictionary * data = m[@"data"];
                    NSString * image = [data objectForKey:@"image"];
                    [imageArr addObject:image];
                    [bannerArray addObject:data];
                }
                break;
            }
           //NSMutableArray * imageArray = [SecondItemListModel arrayOfModelsFromDictionaries:imageArr error:nil];
            dispatch_async(dispatch_get_main_queue(), ^{
                callBack(imageArr, nil);
            });
        }else{
            dispatch_async(dispatch_get_main_queue(), ^{
                callBack(nil,error);
            });
        }
    }];
}

@end
