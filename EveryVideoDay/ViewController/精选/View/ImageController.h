//
//  ImageController.h
//  EveryVideoDay
//
//  Created by qianfeng on 16/10/18.
//  Copyright © 2016年 一杯清火茶. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SectionListModelDic.h"


@interface ImageController : UIViewController

@property (nonatomic, strong) ItemListModelArr * dataDic;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (nonatomic, assign) NSInteger index;

@end
