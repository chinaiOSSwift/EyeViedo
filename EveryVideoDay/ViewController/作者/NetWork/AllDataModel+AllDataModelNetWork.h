//
//  AllDataModel+AllDataModelNetWork.h
//  EveryVideoDay
//
//  Created by MS on 16/10/15.
//  Copyright © 2016年 一杯清火茶. All rights reserved.
//


//新建立一个类 在Objective-C Flile里建立，category:AllDataModel
#import "AllDataModel.h"
#import "AllDataModel+AllDataModelNetWork.h"


@interface AllDataModel (AllDataModelNetWork)

//+(void)requestAllData:(void(^)(NSArray *hotAuthorArray,NSArray *leftTextArray,NSArray *videoArray,NSArray *collectionViewArray,NSError *error))callBack;

+(void)requestAllData:(void(^)(NSArray *AllDataArray,NSArray *CollectionArr,NSError *error))callBack;

//+(void)requestCollectionData:(void(^)(NSArray * collectionArr,NSError * error))callBack;

@end
