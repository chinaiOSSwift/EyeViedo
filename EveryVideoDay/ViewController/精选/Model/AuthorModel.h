//
//  AuthorModel.h
//  EveryVideoDay
//
//  Created by qianfeng on 16/10/13.
//  Copyright © 2016年 一杯清火茶. All rights reserved.
//

#import "JSONModel.h"

@interface AuthorModel : JSONModel

@property (nonatomic, copy) NSString * adTrack;
@property (nonatomic, copy) NSString * Description;
@property (nonatomic, copy) NSString * icon;
@property (nonatomic, copy) NSString * ID;
@property (nonatomic, copy) NSString * latestReleaseTime;
@property (nonatomic, copy) NSString * link;
@property (nonatomic, copy) NSString * name;
@property (nonatomic, copy) NSString * videoNum;

@end
