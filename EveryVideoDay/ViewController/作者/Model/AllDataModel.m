//
//  AllDataModel.m
//  EveryVideoDay
//
//  Created by MS on 16/10/15.
//  Copyright © 2016年 一杯清火茶. All rights reserved.
//

#import "AllDataModel.h"

@implementation AllDataModel

//当模型数据和json属性个数不同时，防止代码崩溃.
+(BOOL)propertyIsOptional:(NSString *)propertyName{
    return YES;
}

//
+(JSONKeyMapper *)keyMapper{
    return [[JSONKeyMapper alloc]initWithModelToJSONDictionary:@{@"Id":@"id",@"Description":@"description"}];
}

@end
