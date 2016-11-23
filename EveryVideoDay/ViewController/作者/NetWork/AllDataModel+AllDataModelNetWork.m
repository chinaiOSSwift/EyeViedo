//
//  AllDataModel+AllDataModelNetWork.m
//  EveryVideoDay
//
//  Created by MS on 16/10/15.
//  Copyright © 2016年 一杯清火茶. All rights reserved.
//

#import "AllDataModel+AllDataModelNetWork.h"
#import "BaseRequest.h"

@implementation AllDataModel (AllDataModelNetWork)

+(void)requestAllData:(void (^)(NSArray *, NSArray *, NSError *))callBack{
    [BaseRequest getWithURL:@"http://baobab.wandoujia.com/api/v3/tabs/pgcs?_s=67d543014598ddccaf23604fa99cc204&f=iphone&net=wifi&p_product=EYEPETIZER_IOS&u=843e5559476fa559a979a5ed6bee2a88e115cb27&v=2.7.0&vc=1305" para:nil calBack:^(NSData *data, NSError *error) {
        
        NSMutableArray * AllDataArr = [[NSMutableArray alloc]init];
        NSMutableArray * collectionArr = [[NSMutableArray alloc]init];
        
        if (!error) {
            NSDictionary * obj = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            
                        NSArray * itemListArr = obj[@"itemList"];
                        for (NSDictionary * dict in itemListArr) {
            
                            //
                            AllDataModel *allModel = [[AllDataModel alloc]init];
            
                            //
                            if ([dict[@"type"] isEqualToString:@"leftAlignTextHeader"]) {
                                NSDictionary *dataDic = dict[@"data"];
                                allModel.text = dataDic[@"text"];
                                allModel.dataType = dataDic[@"dataType"];
                                [AllDataArr addObject:allModel];
                            }else if([dict[@"type"] isEqualToString:@"briefCard"]){
                                NSDictionary *dataDic = dict[@"data"];
                                allModel.Description = dataDic[@"description"];
                                allModel.icon = dataDic[@"icon"];
                                allModel.Id = dataDic[@"id"];
                                allModel.subTitle = dataDic[@"subTitle"];
                                allModel.dataType = dataDic[@"dataType"];
                                allModel.title = dataDic[@"title"];
                                allModel.actionUrl = dataDic[@"actionUrl"];
                                [AllDataArr addObject:allModel];
                            }else if ([dict[@"type"] isEqualToString:@"videoCollectionWithBrief"]){
                                NSDictionary * dataDic = dict[@"data"][@"header"];
                                allModel.Description = dataDic[@"description"];
                                allModel.icon = dataDic[@"icon"];
                                allModel.Id = dataDic[@"id"];
                                allModel.subTitle = dataDic[@"subTitle"];
                                allModel.vTitle = dataDic[@"title"];
                                allModel.actionUrl = dataDic[@"actionUrl"];
                                allModel.count = dict[@"data"][@"count"];
                                allModel.dataType = dict[@"data"][@"dataType"];//
                                [AllDataArr addObject:allModel];
            
                                //
                                NSArray * dataListArr = dict[@"data"][@"itemList"];
                                for(NSDictionary *itemDic in dataListArr){
                                    //
                                    NSDictionary * dataDic = itemDic[@"data"];
                                    allModel.detail = dataDic[@"cover"][@"detail"];//collection图
                                    allModel.category = dataDic[@"category"];//collection分类
                                    allModel.duration = dataDic[@"duration"];//collection时间
                                    allModel.title = dataDic[@"title"];//collection标题
                                    //点击collection的信息
                                    allModel.collectionCount = dataDic[@"consumption"][@"collectionCount"];//收藏
                                    allModel.replyCount = dataDic[@"consumption"][@"replyCount"];//评价
                                    allModel.shareCount = dataDic[@"consumption"][@"shareCount"];//分享
                                    //点击collection上边cell进入的信息
                                    allModel.Description = dataDic[@"author"][@"description"];//描述
                                    allModel.icon = dataDic[@"author"][@"icon"];//头像
                                    allModel.Id = dataDic[@"author"][@"id"];//id
                                    allModel.name = dataDic[@"author"][@"name"];//作者名
                                    allModel.playUrl = dataDic[@"playUrl"];//播放视频的网址
                                    [collectionArr addObject:allModel];
                                }
                            }
                        }
                        dispatch_async(dispatch_get_main_queue(), ^{
                            callBack(AllDataArr,collectionArr,nil);
                        });
        }else{
            dispatch_async(dispatch_get_main_queue(), ^{
                callBack(nil,nil,error);
            });
        }
    }];
}
@end
