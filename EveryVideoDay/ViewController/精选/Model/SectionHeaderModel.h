//
//  SectionHeaderModel.h
//  EveryVideoDay
//
//  Created by qianfeng on 16/10/13.
//  Copyright © 2016年 一杯清火茶. All rights reserved.
//

#import "JSONModel.h"
#import "HeadDataModel.h"
@interface SectionHeaderModel : JSONModel

@property (nonatomic, copy) HeadDataModel * headerModel;
@property (nonatomic, copy) NSString * type;

@end
