//
//  FooterDataModel.h
//  EveryVideoDay
//
//  Created by qianfeng on 16/10/13.
//  Copyright © 2016年 一杯清火茶. All rights reserved.
//

#import "JSONModel.h"

@interface FooterDataModel : JSONModel

@property (nonatomic, copy) NSString * actionUrl;
@property (nonatomic, copy) NSString * adTrack;
@property (nonatomic, copy) NSString * font;
@property (nonatomic, copy) NSString * text;
@property (nonatomic, copy) NSString * height;
@end
