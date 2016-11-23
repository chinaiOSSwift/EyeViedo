//
//  ImageCell.m
//  EveryVideoDay
//
//  Created by qianfeng on 16/10/13.
//  Copyright © 2016年 一杯清火茶. All rights reserved.
//

#import "ImageCell.h"
#import "BaseCollectionViewCell.h"
#import "XJItemModelDic.h"

@implementation ImageCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.contentView.backgroundColor = JXGRAY_COLOR;
    [_collectionView registerNib:[UINib nibWithNibName:@"BaseCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"BaseCollectionViewCell"];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = [UIColor clearColor];
    
    //
    _coverImageView.userInteractionEnabled = true;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(ImageViewTapHandle:)];
    [_coverImageView addGestureRecognizer:tap];
}


#pragma mark - 图片点击事件
- (void)ImageViewTapHandle:(UITapGestureRecognizer *)tap{
    NSLog(@"iamgeView 被点击");
}

#pragma mark - UICollectionView 协议方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataDic.itemListArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * imaggeCellID = @"BaseCollectionViewCell";
    BaseCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:imaggeCellID forIndexPath:indexPath];
    
    XJItemModelDic * model = self.dataDic.itemListArr[indexPath.item];
    
    cell.titleL.textAlignment = NSTextAlignmentLeft; // 居左显示
    cell.titleL.text = [NSString stringWithFormat:@"     %@",model.title];
    [cell.iconImageView sd_setImageWithURL:[NSURL URLWithString:model.detail]];
    NSString * category = model.category; // 开胃
    NSString * duration = model.duration; // 持续时间
    NSInteger min = duration.integerValue / 60;
    NSInteger sec = duration.integerValue % 60;
    cell.subTitleL.textAlignment = NSTextAlignmentLeft; // 居左显示
    cell.subTitleL.text = [NSString stringWithFormat:@"     #%@ / %.2ld'%.2ld''",category,min,sec];
    return cell;

}







// 返回cell的大小


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return  CGSizeMake(collectionView.mj_w - 50, collectionView.mj_h);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    ImageController * viewController = [[ImageController alloc]init];
    viewController.dataDic = self.dataDic;
    viewController.index = indexPath.row;
    viewController.hidesBottomBarWhenPushed = true;
    [self.delegate pushViewImageController:viewController];
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}

@end
