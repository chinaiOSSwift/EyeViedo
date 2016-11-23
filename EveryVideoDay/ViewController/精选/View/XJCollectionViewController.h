//
//  XJCollectionViewController.h
//  EveryVideoDay
//
//  Created by qianfeng on 16/10/17.
//  Copyright © 2016年 一杯清火茶. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XJItemModelDic.h"
#import "XJDetailCell.h"
#import "SectionListModelDic.h"
@interface XJCollectionViewController : UIViewController
@property (nonatomic, strong) SectionListModelDic * dataDic;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (nonatomic, assign) NSInteger index;

@end
