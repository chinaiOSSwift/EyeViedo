//
//  XJData.h
//  EveryVideoDay
//
//  Created by qianfeng on 16/10/18.
//  Copyright © 2016年 一杯清火茶. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XJManager.h"

@interface XJData : NSObject

+ (void)favoriteApp:(XJItemModelDic *)modelDic;
+ (NSMutableArray *)selectNearbyAppsWithAppId;
+ (BOOL)isFavorited:(XJItemModelDic *)model;
+ (BOOL)removeApp:(XJItemModelDic *)model;
+ (BOOL)removeAll:(NSArray *)array;
@end
