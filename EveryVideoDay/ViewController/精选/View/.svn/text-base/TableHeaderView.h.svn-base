//
//  TableHeaderView.h
//  EveryVideoDay
//
//  Created by qianfeng on 16/10/17.
//  Copyright © 2016年 一杯清火茶. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SectionListModelDic.h"
#import "XJCollectionViewController.h"
@protocol FirstCellDelegate <NSObject>

- (void)pushViewController:(XJCollectionViewController *)viewController;

@end
@interface TableHeaderView : UIView <UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

// 传入第一个upDataArr 的 ItemDataModel 数组
@property (nonatomic, strong) SectionListModelDic * dataDic;
@property (nonatomic, strong) UICollectionView * firstCollection;

@property (nonatomic, strong) UIView * check;
@property (weak,nonatomic) id<FirstCellDelegate> delegate; // 代理
@end
