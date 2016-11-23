//
//  TableHeaderView.m
//  EveryVideoDay
//
//  Created by qianfeng on 16/10/17.
//  Copyright © 2016年 一杯清火茶. All rights reserved.
//

#import "TableHeaderView.h"
#import "FirstCollectionCell.h"
#import "XJItemModelDic.h"
#import "FirstCell.h"
@implementation TableHeaderView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self){
    
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _firstCollection = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height - 50) collectionViewLayout:layout];
        _firstCollection.backgroundColor = [UIColor whiteColor];
        _firstCollection.delegate = self;
        _firstCollection.dataSource = self;
        _firstCollection.bounces = false;
        // 注册cell
        [_firstCollection registerNib:[UINib nibWithNibName:@"FirstCollectionCell" bundle:nil] forCellWithReuseIdentifier:@"FirstCollectionCell"];
        _firstCollection.backgroundColor = [UIColor clearColor];
        [self addSubview:_firstCollection];
        
        _check = [[UIView alloc]initWithFrame:CGRectMake(0, _firstCollection.mj_h + _firstCollection.mj_y, _firstCollection.mj_w, 50)];
        _check.userInteractionEnabled = true;
        
        UILabel * checkL = [[UILabel alloc]initWithFrame:CGRectMake(0, 10, frame.size.width, 30)];
        checkL.tag = 1000;
        checkL.textAlignment = NSTextAlignmentCenter;
        checkL.textColor = JXTEXTGRAY_COLOR;
        checkL.text = @"查看往期编辑精选   >";
//        checkL.text = [NSString stringWithFormat:@"%@   %@",_dataDic.footertext,@">"];
        // 添加点击事件
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(checkTapHandle:)];
        [_check addGestureRecognizer:tap];
        
//        checkL.backgroundColor = [UIColor redColor];
        
        [_check addSubview:checkL];
        _check.backgroundColor = [UIColor clearColor];
        [self addSubview:_check];
        
    }
    return self;
}


- (void)checkTapHandle:(UITapGestureRecognizer *)tap{
    UILabel * checkL = [tap.view viewWithTag:1000];
    checkL.text = [NSString stringWithFormat:@"%@   %@",_dataDic.footertext,@">"];
    NSLog(@"查看往期编辑精选 %@, %@",self.dataDic.actionUrl, self.dataDic.footertext);
}

#pragma mark - UICollectionView 协议方法

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
//        NSLog(@"firstCell 返回collectionView 的item个数:%ld, type = %@",self.dataDic.secItemListArr.count, self.dataDic.type);
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

// 点击事件
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    // 新建一个viewControll
    XJCollectionViewController * detailView = [[XJCollectionViewController alloc]init];
    detailView.index = indexPath.row;
    detailView.dataDic = self.dataDic;
    detailView.hidesBottomBarWhenPushed = true;
    // 需要用代理传值
    [self.delegate pushViewController:detailView];
}

@end
