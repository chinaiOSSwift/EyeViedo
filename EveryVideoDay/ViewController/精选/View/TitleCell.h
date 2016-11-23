//
//  TitleCell.h
//  EveryVideoDay
//
//  Created by qianfeng on 16/10/13.
//  Copyright © 2016年 一杯清火茶. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseCollectionViewCell.h"
#import "SectionListModelDic.h"
#import "ImageController.h"

@protocol TitleCellDelegate <NSObject>

- (void)pushViewTitleController:(ImageController *)viewController;

@end


@interface TitleCell : UITableViewCell <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

//使用方法 需要传 一个 ItemDataModel
@property (weak, nonatomic) IBOutlet UILabel *titleL;

@property (weak, nonatomic) IBOutlet UILabel *subTitleL;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (weak, nonatomic) IBOutlet UIPageControl *pageController;

@property (nonatomic, strong) ItemListModelArr * dataDic;

@property (weak, nonatomic) IBOutlet UIView *titleView;

@property (weak,nonatomic) id<TitleCellDelegate> delegate; // 代理
//ItemListModelArr



@end
