//
//  SectionListModelDic.m
//  EveryVideoDay
//
//  Created by qianfeng on 16/10/16.
//  Copyright © 2016年 一杯清火茶. All rights reserved.
//

#import "SectionListModelDic.h"
#import "XJItemModelDic.h"
@implementation SectionListModelDic

+ (BOOL)propertyIsOptional:(NSString *)propertyName{
//    NSLog(@"SectionListModelDic 里面: - %@",propertyName);
    return true;
}

+ (JSONKeyMapper *)keyMapper{
    return [[JSONKeyMapper alloc]initWithModelToJSONDictionary:@{@"ID":@"id"}];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict error:(NSError *__autoreleasing *)err{
    if (self = [super initWithDictionary:dict error:err]){
        NSError * error = nil;
        NSArray * array = dict[@"itemList"];
//        NSLog(@"解析数据:个数 - %ld",array.count);
        if (array.count > 1){
            self.secItemListArr = [XJItemModelDic arrayOfModelsFromDictionaries:array error:&error];
        }else{
            self.secItemListArr = [ItemListModelArr arrayOfModelsFromDictionaries:array error:&error];
        }
        self.actionUrl = dict[@"footer"][@"data"][@"actionUrl"];
        //        self.footeradTrack = dict[@"footer"][@"data"][@"adTrack"];
        //        self.footerfont = dict[@"footer"][@"data"][@"font"];
        self.footertext = dict[@"footer"][@"data"][@"text"];
        //        self.footerType = dict[@"footer"][@"type"];
        //        self.headeradTrack = dict[@"header"][@"data"][@"adTrack"];
        //        self.headerfont = dict[@"header"][@"data"][@"font"];
        //        self.headertext = dict[@"header"][@"data"][@"text"];
        //        self.headertype = dict[@"header"][@"type"];
    }
    return self;
}





@end
