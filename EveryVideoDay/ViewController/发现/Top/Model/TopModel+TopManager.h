//
//  TopModel+TopManager.h
//  EveryVideoDay
//
//  Created by qianfeng on 16/10/18.
//  Copyright © 2016年 一杯清火茶. All rights reserved.
//

#import "TopModel.h"

@interface TopModel (TopManager)
+(void)requestTopData:(void(^)(NSArray * array, NSArray * imageArray, NSArray * webArray, NSError * error))callBack;

@end
