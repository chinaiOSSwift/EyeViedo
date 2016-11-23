//
//  ItemListModelArr.m
//  EveryVideoDay
//
//  Created by qianfeng on 16/10/16.
//  Copyright © 2016年 一杯清火茶. All rights reserved.
//

#import "ItemListModelArr.h"
#import "XJItemModelDic.h"

@implementation ItemListModelArr

+ (BOOL)propertyIsOptional:(NSString *)propertyName{
//    NSLog(@"ItemListModelArr 里面: - %@",propertyName);
    return true;
}

+ (JSONKeyMapper *)keyMapper{
    return [[JSONKeyMapper alloc]initWithModelToJSONDictionary:@{@"ID":@"id"}];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict error:(NSError *__autoreleasing *)err{
    self = [super initWithDictionary:dict error:err];
    if (self){
        
//        NSLog(@"keys - %@",[dict allKeys]);
        NSError * error = nil;
//        self.itemListArr = [NSMutableArray array]; // 初始化
        NSArray * array = dict[@"data"][@"itemList"];
//        NSLog(@"array.count - %ld",array.count);
        self.itemListArr = [XJItemModelDic arrayOfModelsFromDictionaries:array error:&error];
        
        /*
         @property (nonatomic, copy) NSString * actionUrl;
         @property (nonatomic, copy) NSString * cover;
         @property (nonatomic, copy) NSString * font;
         @property (nonatomic, copy) NSString * ID; // 注意
         @property (nonatomic, copy) NSString * title;
         */
//        self.adTrack = dict[@"data"][@"adTrack"];
        self.count = dict[@"data"][@"count"];
        self.dataType = dict[@"data"][@"dataType"];
        self.actionUrl = dict[@"data"][@"header"][@"actionUrl"];
        self.cover = dict[@"data"][@"header"][@"cover"];
        self.font = dict[@"data"][@"header"][@"font"];
        self.ID = dict[@"data"][@"header"][@"id"];
        self.title = dict[@"data"][@"header"][@"title"];
        self.subTitle = dict[@"data"][@"header"][@"subTitle"];
        self.type = dict[@"type"];
        
        
    }
    return self;
}



@end
