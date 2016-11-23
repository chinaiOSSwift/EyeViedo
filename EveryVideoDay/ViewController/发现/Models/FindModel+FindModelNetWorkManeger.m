//
//  FindModel+FindModelNetWorkManeger.m
//  EveryVideoDay
//
//  Created by qianfeng on 16/10/14.
//  Copyright © 2016年 一杯清火茶. All rights reserved.
//

#import "FindModel+FindModelNetWorkManeger.h"

@implementation FindModel (FindModelNetWorkManeger)

+(void)requestFindBannerData:(void (^)(NSArray *, NSArray *, NSArray *, NSError *))callBack{
    NSString * URL = @"http://baobab.wandoujia.com/api/v3/discovery?_s=f5b9d52f32b1afa3c1c09a536c8effa4&f=iphone&net=wifi&u=843e5559476fa559a979a5ed6bee2a88e115cb27&v=2.6.0&vc=1209";
    [BaseRequest getWithURL:URL para:nil calBack:^(NSData *data, NSError *error) {
        if (!error) {
            NSDictionary * obj = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
            NSArray * itemListArr = obj[@"itemList"];
            NSMutableArray * bannerArr = [[NSMutableArray alloc]init];
            NSMutableArray * firstArr = [[NSMutableArray alloc]init];
            NSMutableArray * imageArr = [[NSMutableArray alloc]init];
            for (NSDictionary * i in itemListArr) {
                NSString * type = i[@"type"];
                if ([type  isEqual: @"squareCard"]) {
                    NSDictionary * dataDic = i[@"data"];
                    [bannerArr addObject:dataDic];
                }if ([type isEqual:@"rectangleCard"]){
                    NSDictionary * dataDic = i[@"data"];
                    NSString * image = dataDic[@"image"];
                    [imageArr addObject:image];
                }
            }
            for ( NSDictionary * data in bannerArr){
                NSDictionary * a = bannerArr[0];
                NSDictionary * b = bannerArr[1];
                [firstArr addObject:a];
                [firstArr addObject:b];
                break;
            }
            for (NSDictionary * aa in bannerArr){
                [bannerArr removeObjectAtIndex:0];
                break;
            }
            for (NSDictionary * bb in bannerArr){
                [bannerArr removeObjectAtIndex:0];
                break;
            }
            NSMutableArray * bannerArray = [FindModel arrayOfModelsFromDictionaries:bannerArr error:nil];
            NSMutableArray * firstArray = [FindModel arrayOfModelsFromDictionaries:firstArr error:nil];
            //NSMutableArray * imageArray = [FindModel arrayOfModelsFromDictionaries:imageArr error:nil];
            dispatch_async(dispatch_get_main_queue(), ^{
                callBack(bannerArray, firstArray, imageArr,nil);
            });
        }else{
            dispatch_async(dispatch_get_main_queue(), ^{
                callBack(nil,nil,nil,error);
            });
        }
    }];
}
@end
