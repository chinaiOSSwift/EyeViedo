//
//  ImageController.m
//  EveryVideoDay
//
//  Created by qianfeng on 16/10/18.
//  Copyright © 2016年 一杯清火茶. All rights reserved.
//

#import "ImageController.h"
#import "BaseCollectionViewCell.h"
#import "XJItemModelDic.h"
#import "XJDetailCell.h"
@interface ImageController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property(nonatomic, assign)BOOL flag;

@end

@implementation ImageController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    [self.collectionView registerNib:[UINib nibWithNibName:@"XJDetailCell" bundle:nil] forCellWithReuseIdentifier:@"XJDetailCell"];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    // 分页 关闭弹簧效果
    self.collectionView.pagingEnabled = true;
    self.collectionView.bounces = false;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionView 协议方法

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.dataDic.itemListArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString * fistCellID = @"XJDetailCell";
    
//    XJItemModelDic * model = self.dataDic.itemListArr[indexPath.item];
    
    XJDetailCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier: fistCellID forIndexPath:indexPath];
    // 创建有所的cell
    if (self.flag == true){
        XJItemModelDic * dataModel = self.dataDic.itemListArr[self.index];//找到对应的数组, 然后取值
        self.flag = false;
        cell.playUrl = dataModel.playUrl;
        cell.delegate = self;
        [cell customWithXJItemModel:dataModel];
    }else{
        XJItemModelDic * dataModel = self.dataDic.itemListArr[indexPath.item];//找到对应的数组, 然后取值
        cell.playUrl = dataModel.playUrl;
        cell.delegate = self;
        [cell customWithXJItemModel:dataModel];
    }
    return cell;
}
// Cell 的大小

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return  CGSizeMake(collectionView.mj_w,collectionView.mj_h - 64);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}


- (void)presentPlayerController:(AVPlayerViewController *)playController{
    [self.navigationController pushViewController:playController animated:true];
}


@end
