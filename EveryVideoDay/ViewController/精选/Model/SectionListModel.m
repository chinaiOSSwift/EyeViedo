//
//  SectionListModel.m
//  EveryVideoDay
//
//  Created by qianfeng on 16/10/13.
//  Copyright © 2016年 一杯清火茶. All rights reserved.
//

#import "SectionListModel.h"

@implementation SectionListModel

+ (JSONKeyMapper *)keyMapper{
    return [[JSONKeyMapper alloc]initWithModelToJSONDictionary:@{@"ID":@"id"}];
}

+ (BOOL)propertyIsOptional:(NSString *)propertyName{

    return true;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict error:(NSError *__autoreleasing *)err{
    if (self = [super initWithDictionary:dict error:err]){
        self.footerModel = nil;
        self.headerModel = nil;
        NSError * error = nil;
        NSArray * array = dict[@"itemList"];
        
        self.footerModel = dict[@"footer"];
        self.headerModel = dict[@"header"];
        self.itemListModel = [ItemListModel arrayOfModelsFromDictionaries:array error:&error];
        
    }
    return self;
}


@end
