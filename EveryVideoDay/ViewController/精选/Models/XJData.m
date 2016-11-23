//
//  XJData.m
//  EveryVideoDay
//
//  Created by qianfeng on 16/10/18.
//  Copyright © 2016年 一杯清火茶. All rights reserved.
//

#import "XJData.h"

@implementation XJData

+ (void)createFavoriteTable
{
    XJManager *manager = [XJManager shareManager];
    NSString *sql = @"create table if not exists Favorite(APPid varchar primary key, detail varchar,title varchar,duration varchar,category varchar,author_icon varchar,author_name varchar,author_videoNum varchar,author_description varchar,Description varchar,collectionCount varchar,shareCount varchar,replyCount varchar,playUrl varchar)";
    //[manager.dataBase executeUpdate:sql];
    BOOL reqsult = [manager.dataBase executeUpdate:sql];
    if (reqsult) {
        NSLog(@"创建收藏表成功");
    }else
    {
        NSLog(@"创建收藏表失败");
    }
}

+ (void)favoriteApp:(XJItemModelDic *)modelDic
{
    //如果表不存在，先建表
    [self createFavoriteTable];
    XJManager *manager = [XJManager shareManager];
    NSString *sql = @"insert into Favorite(APPid, detail,title,duration,category,author_icon,author_name,author_videoNum,author_description,Description,collectionCount,shareCount,replyCount,playUrl) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
    
    
    BOOL result = [manager.dataBase executeUpdate:sql,modelDic.playUrl,modelDic.detail,modelDic.title,modelDic.duration,modelDic.category,modelDic.author_icon,modelDic.author_name,modelDic.author_videoNum,modelDic.author_description,modelDic.Description,modelDic.collectionCount,modelDic.shareCount,modelDic.replyCount,modelDic.playUrl];
    if (result) {
        NSLog(@"收藏成功");
    }else
    {
        NSLog(@"收藏失败");
    }
}

+ (NSMutableArray *)selectNearbyAppsWithAppId
{
    XJManager *manager = [XJManager shareManager];
    NSString *sql =@"select * from Favorite";
    FMResultSet *appsSet = [manager.dataBase executeQuery:sql,nil];
    NSMutableArray *array = [[NSMutableArray alloc]init];
    while ([appsSet next]) {
        XJItemModelDic *model = [[XJItemModelDic alloc] init];
        model.ID = [appsSet stringForColumn:@"APPid"];
        model.detail = [appsSet stringForColumn:@"detail"];
        model.title = [appsSet stringForColumn:@"title"];
        model.duration = [appsSet stringForColumn:@"duration"];
        model.category = [appsSet stringForColumn:@"category"];
        model.author_icon = [appsSet stringForColumn:@"author_icon"];
        model.author_name = [appsSet stringForColumn:@"author_name"];
        model.author_videoNum = [appsSet stringForColumn:@"author_videoNum"];
        model.author_description = [appsSet stringForColumn:@"author_description"];
        model.Description = [appsSet stringForColumn:@"Description"];
        model.collectionCount = [appsSet stringForColumn:@"collectionCount"];
        model.shareCount = [appsSet stringForColumn:@"shareCount"];
        model.replyCount = [appsSet stringForColumn:@"replyCount"];
        model.playUrl = [appsSet stringForColumn:@"playUrl"];
        [array addObject:model];
    }
    return array;
}

+ (BOOL)isFavorited:(XJItemModelDic *)model
{
    XJManager *manager = [XJManager shareManager];
    NSString *sql = @"select * from Favorite where APPid = ?";
    FMResultSet *appSet = [manager.dataBase executeQuery:sql,model.ID];
    while ([appSet next]) {
        
        return YES;
    }
    return NO;
}

+ (BOOL)removeApp:(XJItemModelDic *)model
{
    XJManager *manager = [XJManager shareManager];
    NSString *sql = @"delete from Favorite where APPid = ?";
    BOOL result = [manager.dataBase executeUpdate:sql,model.ID];
    
    return result;
}

+ (BOOL)removeAll:(NSArray *)array{
    XJManager *manager = [XJManager shareManager];
    NSString *sql = @"DROP TABLE Favorite";
    BOOL result = [manager.dataBase executeUpdate:sql,nil];
    return result;
}

@end
