//
//  SectionListModel.h
//  EveryVideoDay
//
//  Created by qianfeng on 16/10/13.
//  Copyright © 2016年 一杯清火茶. All rights reserved.
//

#import "JSONModel.h"
#import "FooterModel.h"
#import "ItemListModel.h"
#import "SectionHeaderModel.h"

@interface SectionListModel : JSONModel

@property (nonatomic, copy) NSString * adTrack;
@property (nonatomic, copy) NSString * count;
@property (nonatomic, copy) FooterModel * footerModel;
@property (nonatomic, copy) SectionHeaderModel * headerModel; // 有可能有问题
@property (nonatomic, copy) NSString * ID; // 注意

@property (nonatomic, copy) NSMutableArray * itemListModel;
@property (nonatomic, copy) NSString * type;

@end
