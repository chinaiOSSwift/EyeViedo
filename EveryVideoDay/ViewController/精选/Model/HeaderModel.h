//
//  HeaderModel.h
//  EveryVideoDay
//
//  Created by qianfeng on 16/10/13.
//  Copyright © 2016年 一杯清火茶. All rights reserved.
//

#import "JSONModel.h"

@interface HeaderModel : JSONModel
@property (nonatomic, copy) NSString * actionUrl;
@property (nonatomic, copy) NSString * cover;
@property (nonatomic, copy) NSString * font;
@property (nonatomic, copy) NSString * ID; // 注意
@property (nonatomic, copy) NSString * title;
@property (nonatomic, copy) NSString * subTitle; // 副标题
@end
