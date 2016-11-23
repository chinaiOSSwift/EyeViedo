//
//  ConsumptionModel.h
//  EveryVideoDay
//
//  Created by qianfeng on 16/10/13.
//  Copyright © 2016年 一杯清火茶. All rights reserved.
//

#import "JSONModel.h"

@interface ConsumptionModel : JSONModel

@property (nonatomic, copy) NSString * collectionCount;
@property (nonatomic, copy) NSString * replyCount;
@property (nonatomic, copy) NSString * shareCount;


@end
