//
//  TitleCell.m
//  EveryVideoDay
//
//  Created by qianfeng on 16/10/13.
//  Copyright © 2016年 一杯清火茶. All rights reserved.
//

#import "TitleCell.h"
#import "XJItemModelDic.h"

@implementation TitleCell 

- (void)awakeFromNib {
    [super awakeFromNib];
    self.contentView.backgroundColor = JXGRAY_COLOR;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = [UIColor clearColor];
    self.collectionView.pagingEnabled = true;
    self.collectionView.bounces = false;
    [self.collectionView registerNib:[UINib nibWithNibName:@"BaseCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"BaseCollectionViewCell"];
    
    
    // pageController 设置
    self.pageController.backgroundColor = [UIColor clearColor];
//    self.pageController.numberOfPages = self.dataDic.itemListArr.count;

    self.pageController.pageIndicatorTintColor = [UIColor lightGrayColor]; // 指示颜色
    self.pageController.currentPage = 0;
    self.pageController.currentPageIndicatorTintColor = [UIColor blackColor];
    self.pageController.userInteractionEnabled = false;
    
    
    // 给你view 添加点击事件
    self.titleView.userInteractionEnabled = true;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(viewTapHandle:)];
    [self.titleView addGestureRecognizer:tap];
    
}


#pragma mark - view点击事件

- (void)viewTapHandle:(UITapGestureRecognizer *)tap{
    NSLog(@"view 被点击");
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

#pragma mark - UICollectionView 的协议方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    self.pageController.numberOfPages = self.dataDic.itemListArr.count;
    return self.dataDic.itemListArr.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(collectionView.mj_w, collectionView.mj_h);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString * titleCellID = @"BaseCollectionViewCell";
    // 取模型 赋值

    XJItemModelDic * model = self.dataDic.itemListArr[indexPath.item];
    
    
    BaseCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:titleCellID forIndexPath:indexPath];
    [cell.iconImageView sd_setImageWithURL:[NSURL URLWithString:model.detail]]; // 图片
    cell.titleL.text = model.title; // 标题
    NSString * category = model.category; // 开胃
    NSString * duration = model.duration; // 持续时间
    NSInteger min = duration.integerValue / 60;
    NSInteger sec = duration.integerValue % 60;
    
    cell.subTitleL.text = [NSString stringWithFormat:@"#%@ / %.2ld'%.2ld''",category,min,sec];
    return  cell;
    
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}

// 滑动结束
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [UIView animateWithDuration:0.25 animations:^{
        self.pageController.currentPage = self.collectionView.contentOffset.x / (SCREEN_W);
    }];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    ImageController * viewController = [[ImageController alloc]init];
    viewController.dataDic = self.dataDic;
    viewController.index = indexPath.row;
    viewController.hidesBottomBarWhenPushed = true;
    [self.delegate pushViewTitleController:viewController];
}



@end
