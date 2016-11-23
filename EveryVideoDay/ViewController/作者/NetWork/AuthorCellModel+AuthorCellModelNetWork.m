//
//  AuthorCellModel+AuthorCellModelNetWork.m
//  EveryVideoDay
//
//  Created by MS on 16/10/18.
//  Copyright © 2016年 一杯清火茶. All rights reserved.
//

#import "AuthorCellModel+AuthorCellModelNetWork.h"
#import "BaseRequest.h"

@implementation AuthorCellModel (AuthorCellModelNetWork)


+(void)requestAuthorCellData:(NSString *)Id callBack:(void (^)(NSArray *, NSError *))callBack{
    NSDictionary * para = @{@"num":@"20",@"pgcId":Id,@"start":@"0",@"strategy":@"date"};
    [BaseRequest getWithURL:@"http://baobab.wandoujia.com/api/v3/pgc/videos" para:para calBack:^(NSData *data, NSError *error) {
        
        NSMutableArray * authorCellArr = [[NSMutableArray alloc]init];
//        NSMutableArray * authorMessageArr = [[NSMutableArray alloc]init];
        
        if (!error) {
                //第一个数组是authorcell  第二个数组返回的是authormessage
            NSDictionary * obj = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            
            //存放authorcell 在一个数组里
            NSArray * itemListArr = obj[@"itemList"];
            for (NSDictionary * dict in itemListArr) {
                AuthorCellModel *authorModel = [[AuthorCellModel alloc]init];
                NSDictionary * dataDic = dict[@"data"];
               
                //author 部分
                authorModel.Description = dataDic[@"author"][@"description"];
                authorModel.icon = dataDic[@"author"][@"icon"];
                authorModel.Id = dataDic[@"author"][@"id"];
                authorModel.name = dataDic[@"author"][@"name"];
                authorModel.videoNum = dataDic[@"author"][@"videoNum"];
                
                //consumption部分
                authorModel.collectionCount = dataDic[@"consumption"][@"collectionCount"];
                authorModel.replyCount = dataDic[@"consumption"][@"replyCount"];
                authorModel.shareCount = dataDic[@"consumption"][@"shareCount"];
                
                //cover部分
                authorModel.iamge = dataDic[@"cover"][@"detail"];
                
                //cell展示部分
                authorModel.Duration = dataDic[@"duration"];
                authorModel.category = dataDic[@"category"];
                authorModel.title = dataDic[@"title"];
                authorModel.cellId = dataDic[@"id"];
    
                //播放地址
                authorModel.playUrl = dataDic[@"playUrl"];
                authorModel.videoDescription = dataDic[@"description"];
                [authorCellArr addObject:authorModel];
            }
            
            //
            dispatch_async(dispatch_get_main_queue(), ^{
                callBack(authorCellArr,nil);
            });
            
        }else{
            dispatch_async(dispatch_get_main_queue(), ^{
                callBack(nil,error);
            });
        }
    }];
}
@end
