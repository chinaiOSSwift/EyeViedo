//
//  AuthorCellModel.m
//  EveryVideoDay
//
//  Created by MS on 16/10/18.
//  Copyright © 2016年 一杯清火茶. All rights reserved.
//

#import "AuthorCellModel.h"

@implementation AuthorCellModel

+(BOOL)propertyIsOptional:(NSString *)propertyName{
    return YES;
}

+(JSONKeyMapper *)keyMapper{
    return [[JSONKeyMapper alloc]initWithModelToJSONDictionary:@{@"Id":@"id",@"Description":@"description"}];
}

@end
