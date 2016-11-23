//
//  FirstCell.m
//  EveryVideoDay
//
//  Created by qianfeng on 16/10/13.
//  Copyright © 2016年 一杯清火茶. All rights reserved.
//

#import "FirstCell.h"
#import "XJItemModelDic.h"
#import "FirstCollectionCell.h"
#import "FindThirdViewController.h"

@implementation FirstCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.firstCollection.backgroundColor = [UIColor whiteColor];
    self.firstCollection.delegate = self;
    self.firstCollection.dataSource = self;
    self.firstCollection.bounces = false;
    // 注册cell
    [self.firstCollection registerNib:[UINib nibWithNibName:@"FirstCollectionCell" bundle:nil] forCellWithReuseIdentifier:@"FirstCollectionCell"];
    
    
}

#pragma mark - UICollectionView 协议方法

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
//    NSLog(@"firstCell 返回collectionView 的item个数:%ld, type = %@",self.dataDic.secItemListArr.count, self.dataDic.type);
    return self.dataDic.secItemListArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString * fistCellID = @"FirstCollectionCell";
    
    FirstCollectionCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier: fistCellID forIndexPath:indexPath];
    XJItemModelDic * dataModel = self.dataDic.secItemListArr[indexPath.item];//找到对应的数组, 然后取值
    cell.titleL.text = dataModel.title;
    NSInteger min = dataModel.duration.integerValue / 60;
    NSInteger sec = dataModel.duration.integerValue % 60;
    cell.desL.text = [NSString stringWithFormat:@"#%@  /  %.2ld'%.2ld''",dataModel.category,min,sec];
    if(![dataModel.author_name isEqualToString:@""]){
        cell.nameL.text = dataModel.author_name;
//        cell.nameL.backgroundColor = JXTEXTGRAY_COLOR;
    }
    
    [cell.firstCollectionImageView sd_setImageWithURL:[NSURL URLWithString:dataModel.detail]];
    return cell;
}
// Cell 的大小

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return  CGSizeMake(collectionView.mj_w, 300);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    
}

@end
