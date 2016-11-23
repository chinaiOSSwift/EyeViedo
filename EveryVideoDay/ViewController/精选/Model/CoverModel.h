//
//  CoverModel.h
//  EveryVideoDay
//
//  Created by qianfeng on 16/10/13.
//  Copyright © 2016年 一杯清火茶. All rights reserved.
//

#import "JSONModel.h"

@interface CoverModel : JSONModel

@property (nonatomic, copy) NSString * blurred;
@property (nonatomic, copy) NSString * detail;
@property (nonatomic, copy) NSString * feed;
@property (nonatomic, copy) NSString * sharing;

@end
