//
//  ImageCell.h
//  EveryVideoDay
//
//  Created by qianfeng on 16/10/13.
//  Copyright © 2016年 一杯清火茶. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SectionListModelDic.h"
#import "ImageController.h"

@protocol ImageCellDelegate <NSObject>

- (void)pushViewImageController:(ImageController *)viewController;

@end

@interface ImageCell : UITableViewCell <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>


// 传入一个  ItemListModelArr 模型
@property (nonatomic, strong) ItemListModelArr * dataDic;
@property (weak, nonatomic) IBOutlet UIImageView *coverImageView;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak,nonatomic) id<ImageCellDelegate> delegate; // 代理

@end
