//
//  XJManager.h
//  EveryVideoDay
//
//  Created by qianfeng on 16/10/18.
//  Copyright © 2016年 一杯清火茶. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XJItemModelDic.h"
@interface XJManager : NSObject

@property (nonatomic, strong) FMDatabase *dataBase;
/**
 *  获取数据库管理对象的单例方法
 */
+(XJManager *)shareManager;
/**
 *  关闭数据库
 */
+(void)closeDB;

@end
