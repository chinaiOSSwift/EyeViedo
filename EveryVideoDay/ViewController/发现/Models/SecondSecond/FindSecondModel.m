//
//  FindSecondModel.m
//  EveryVideoDay
//
//  Created by qianfeng on 16/10/15.
//  Copyright © 2016年 一杯清火茶. All rights reserved.
//

#import "FindSecondModel.h"

@implementation FindSecondModel

+(JSONKeyMapper *)keyMapper{
    return [[JSONKeyMapper alloc]initWithModelToJSONDictionary:@{@"Description":@"description"}];
}
+(BOOL)propertyIsOptional:(NSString *)propertyName{
    return  YES;
}

@end
