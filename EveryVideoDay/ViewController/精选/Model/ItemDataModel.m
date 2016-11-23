//
//  ItemDataModel.m
//  EveryVideoDay
//
//  Created by qianfeng on 16/10/13.
//  Copyright © 2016年 一杯清火茶. All rights reserved.
//

#import "ItemDataModel.h"

@implementation ItemDataModel

+ (JSONKeyMapper *)keyMapper{
    return [[JSONKeyMapper alloc]initWithModelToJSONDictionary:@{@"Description":@"description",@"ID":@"id"}];
}

+ (BOOL)propertyIsOptional:(NSString *)propertyName{
    return true;
}


- (instancetype)initWithDictionary:(NSDictionary *)dict error:(NSError *__autoreleasing *)err{
    self = [super initWithDictionary:dict error:err];
    if (self){
        // 初始化
        self.authorModel = nil;
        self.consumptionModel = nil;
        self.coverModel = nil;
        self.playInfoModel = nil;
        self.providerModel = nil;
        self.tagModel = nil;
        self.webModel = nil;
        
        [self.authorModel setValuesForKeysWithDictionary:dict[@"author"]]; // 用字典构建一个模型
        [self.consumptionModel setValuesForKeysWithDictionary:dict[@"consumption"]];
        [self.coverModel setValuesForKeysWithDictionary:dict[@"cover"]];
        NSArray * playArr = dict[@"playInfo"];
        NSError * error = nil;
        self.playInfoModel = [PlayInfoModel arrayOfModelsFromDictionaries:playArr error:&error];
        [self.providerModel setValuesForKeysWithDictionary:dict[@"provider"]];
        NSArray * tagArr = dict[@"tags"];
        self.tagModel = [TagModel arrayOfModelsFromDictionaries:tagArr error:&error];
        [self.webModel setValuesForKeysWithDictionary:dict[@"webUrl"]];
    }
    return self;
}


@end












