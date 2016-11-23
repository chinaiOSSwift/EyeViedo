//
//  TagModel.h
//  EveryVideoDay
//
//  Created by qianfeng on 16/10/13.
//  Copyright © 2016年 一杯清火茶. All rights reserved.
//

#import "JSONModel.h"

@interface TagModel : JSONModel

@property (nonatomic, copy) NSString * actionUrl;
@property (nonatomic, copy) NSString * adTrack;
@property (nonatomic, copy) NSString * ID;
@property (nonatomic, copy) NSString * name;

@end
