//
//  AuthorModel.m
//  EveryVideoDay
//
//  Created by qianfeng on 16/10/13.
//  Copyright © 2016年 一杯清火茶. All rights reserved.
//

#import "AuthorModel.h"

@implementation AuthorModel

+ (JSONKeyMapper *)keyMapper{
    return [[JSONKeyMapper alloc]initWithModelToJSONDictionary:@{@"Description":@"description",@"ID":@"id"}];
}

+(BOOL)propertyIsOptional:(NSString *)propertyName{
    return true;
}

@end
