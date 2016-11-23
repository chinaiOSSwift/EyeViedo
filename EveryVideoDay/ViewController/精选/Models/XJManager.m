//
//  XJManager.m
//  EveryVideoDay
//
//  Created by qianfeng on 16/10/18.
//  Copyright © 2016年 一杯清火茶. All rights reserved.
//

#import "XJManager.h"
#import "XJItemModelDic.h"

@implementation XJManager

+(XJManager *)shareManager
{
    static XJManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!manager) {
            
            manager = [[XJManager alloc]init];
            //创建数据库
            NSString *dbPath = [NSString stringWithFormat:@"%@/Documents/dataBase.db",NSHomeDirectory()];
            //创建并打开数据库文件，文件不存在时才创建，否则直接打开
            manager.dataBase = [FMDatabase databaseWithPath:dbPath];
            
        }
    });
    
    if(manager.dataBase.open == NO)
    {
        //打开数据库
        [manager.dataBase open];
    }
    return manager;
}
+(void)closeDB
{
    
    XJManager *manager = [self shareManager];
    if (manager.dataBase.open) {
        [manager.dataBase close];
    }
}
@end
