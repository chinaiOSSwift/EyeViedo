//
//  SectionListModel+NetWorkManager.m
//  EveryVideoDay
//
//  Created by qianfeng on 16/10/13.
//  Copyright © 2016年 一杯清火茶. All rights reserved.
//

#import "SectionListModel+NetWorkManager.h"
#import "SectionListModel.h"
#import "SectionListModelDic.h"


@implementation SectionListModel (NetWorkManager)

+ (void)requestSectionListData:(void (^)(NSArray *, NSError *))callBack{
    
    //    http://baobab.wandoujia.com/api/v3/tabs/selected?pagination=1&needFilter=true&f=iphone&p_product=EYEPETIZER_IOS&v=2.7.0&vc=1305
    
    NSString * url = @"http://baobab.wandoujia.com/api/v3/tabs/selected";
    NSDictionary * para = @{@"pagination":@1,@"needFilter":@"true",@"f":@"iphone",@"p_product":@"EYEPETIZER_IOS",@"v":@"2.7.0",@"vc":@"1305"};
    
    [BaseRequest getWithURL:url para:para calBack:^(NSData *data, NSError *error) {
        if (!error){
            //            NSString * str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
            //            NSLog(@"str = %@",str);
            
            NSDictionary * obj = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            
            NSLog(@"请求下一页数据:%@",obj[@"nextPageUrl"]);
            
            NSArray * sectionListArr = obj[@"sectionList"];
            NSMutableArray * array = [SectionListModelDic arrayOfModelsFromDictionaries:sectionListArr error:nil];
            
            
            // 回调
            dispatch_async(dispatch_get_main_queue(), ^{
                callBack(array,nil);
            });
            
        }else{
            dispatch_async(dispatch_get_main_queue(), ^{
                callBack(nil,error);
            });
        }
    }];
}

#pragma mark - 第二种网络请求, 传入一个字典, 返回一个数组

+ (void)requestSectionListDataWithPara:(NSDictionary *)para callBack:(void (^)(NSArray *, NSError *))callBack{
    [BaseRequest getWithURL:JXHOME_URL para:para calBack:^(NSData *data, NSError *error) {
        if (!error){
            //            NSString * str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
            //            NSLog(@"str = %@",str);
            
            NSDictionary * obj = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            
//            NSLog(@"请求下一页数据:%@",obj[@"nextPageUrl"]);
            
            NSArray * sectionListArr = obj[@"sectionList"];
            NSMutableArray * array = [SectionListModelDic arrayOfModelsFromDictionaries:sectionListArr error:nil];
//            NSLog(@"第一层数据解析 %ld", array.count);
            // 回调
            dispatch_async(dispatch_get_main_queue(), ^{
                callBack(array,nil);
            });
            
        }else{
            dispatch_async(dispatch_get_main_queue(), ^{
                callBack(nil,error);
            });
        }
    }];
}
@end