//
//  FooterModel.h
//  EveryVideoDay
//
//  Created by qianfeng on 16/10/13.
//  Copyright © 2016年 一杯清火茶. All rights reserved.
//

#import "JSONModel.h"
#import "FooterDataModel.h"

@interface FooterModel : JSONModel

@property (nonatomic,copy) FooterDataModel * footerDataModel;
@property (nonatomic,copy) NSString * type;

@end
