//
//  SectionHeaderModel.m
//  EveryVideoDay
//
//  Created by qianfeng on 16/10/13.
//  Copyright © 2016年 一杯清火茶. All rights reserved.
//

#import "SectionHeaderModel.h"

@implementation SectionHeaderModel

+ (BOOL)propertyIsOptional:(NSString *)propertyName{
    return true;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict error:(NSError *__autoreleasing *)err{
    if (self = [super initWithDictionary:dict error:err]){
        self.headerModel = nil;
        [self.headerModel setValuesForKeysWithDictionary:dict[@"data"]];
        
    }
    return self;
}

@end
