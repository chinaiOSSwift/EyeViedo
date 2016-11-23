//
//  PlayInfoModel.h
//  EveryVideoDay
//
//  Created by qianfeng on 16/10/13.
//  Copyright © 2016年 一杯清火茶. All rights reserved.
//

#import "JSONModel.h"

@interface PlayInfoModel : JSONModel

@property (nonatomic, copy) NSString * height;
@property (nonatomic, copy) NSString * name;
@property (nonatomic, copy) NSString * type;
@property (nonatomic, copy) NSString * url;
@property (nonatomic, copy) NSString * width;


@end
