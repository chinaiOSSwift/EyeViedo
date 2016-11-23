//
//  AuthorCellModel+AuthorCellModelNetWork.h
//  EveryVideoDay
//
//  Created by MS on 16/10/18.
//  Copyright © 2016年 一杯清火茶. All rights reserved.
//

#import "AuthorCellModel.h"

@interface AuthorCellModel (AuthorCellModelNetWork)

//用于存储Id.
//cell数据
+(void)requestAuthorCellData:(NSString *)Id callBack:(void(^)(NSArray * auhorCellArr,NSError * error))callBack;

@end
