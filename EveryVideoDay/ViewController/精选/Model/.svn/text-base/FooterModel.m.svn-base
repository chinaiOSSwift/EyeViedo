//
//  FooterModel.m
//  EveryVideoDay
//
//  Created by qianfeng on 16/10/13.
//  Copyright © 2016年 一杯清火茶. All rights reserved.
//

#import "FooterModel.h"

@implementation FooterModel

+ (BOOL)propertyIsOptional:(NSString *)propertyName{
    return true;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict error:(NSError *__autoreleasing *)err{
    if (self = [super initWithDictionary:dict error:err]){
        self.footerDataModel = nil;
        [self.footerDataModel setValuesForKeysWithDictionary:dict[@"data"]];
        
    }
    return self;
}

@end
