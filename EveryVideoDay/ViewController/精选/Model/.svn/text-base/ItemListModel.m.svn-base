//
//  ItemListModel.m
//  EveryVideoDay
//
//  Created by qianfeng on 16/10/13.
//  Copyright © 2016年 一杯清火茶. All rights reserved.
//

#import "ItemListModel.h"

@implementation ItemListModel

+ (BOOL)propertyIsOptional:(NSString *)propertyName{
    return true;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict error:(NSError *__autoreleasing *)err{
    self = [super initWithDictionary:dict error:err];
    if (self){
        self.itemModel = nil;
        self.headModel = nil;
        NSError * error = nil;
        [self.headModel setValuesForKeysWithDictionary:dict[@"header"]];
        NSArray * array = dict[@"itemList"];
        self.itemModel = [ItemModel arrayOfModelsFromDictionaries:array error:&error];
    }
    return self;
}

@end
