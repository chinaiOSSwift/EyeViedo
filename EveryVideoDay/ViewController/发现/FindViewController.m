//
//  FindViewController.m
//  EveryVideoDay
//
//  Created by MS on 16/10/11.
//  Copyright © 2016年 一杯清火茶. All rights reserved.
//NSLog(@"%@",)


#import "FindViewController.h"
#import "FindModel+FindModelNetWorkManeger.h"
#import "SecondItemListModel+SecondFindNetWorkManager.h"
#import "XTADScrollView.h"
#import "FindCell.h"
#import "FindReusableView.h"
#import "FindSecondViewController.h"
#import "FindSecondModel+FindSecondNetWorkManager.h"
#import "TopViewController.h"
#import "TopicViewController.h"

@interface FindViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) NSMutableArray * dataArray;
@property (nonatomic, strong) UICollectionView * contentView;
@property (nonatomic, strong) XTADScrollView * aaView;
@property (nonatomic, strong) XTADScrollView * bbView;
@property (nonatomic, strong) NSString * categoryId;

@end

@implementation FindViewController

-(NSString *)categoryId{
    if (!_categoryId){
        _categoryId = [[NSString alloc]init];
    }
    return _categoryId;
}

-(UICollectionView *)contentView{
    if (!_contentView){
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _contentView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_W, SCREEN_H - 49 - 64) collectionViewLayout:(layout)];
        _contentView.contentOffset = CGPointMake(0,SCREEN_H );
        layout.minimumLineSpacing = 2;
        layout.minimumInteritemSpacing = 2;
        _contentView.backgroundColor = [UIColor whiteColor];
        _contentView.showsVerticalScrollIndicator = false;
        [_contentView registerNib:[UINib nibWithNibName:@"FindCell" bundle:nil] forCellWithReuseIdentifier:@"FindCell"];
        [_contentView registerClass:[FindReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"FindReusableView"];
        _contentView.delegate = self;
        _contentView.dataSource = self;
        
        [self.view addSubview:_contentView];
    }
    return _contentView;
}

-(XTADScrollView *)aaView{
    if (!_aaView){
        _aaView = [[XTADScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W, 228)];
        _aaView.needPageControl = YES;
        _aaView.pageControlPositionType = pageControlPositionTypeRight;
        //是否自动启动轮播
        _aaView.infiniteLoop = YES;
    }
    return  _aaView;
}
-(XTADScrollView *)bbView{
    if (!_bbView){
        _bbView = [[XTADScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W, 228)];
        _bbView.needPageControl = YES;
        _bbView.pageControlPositionType = pageControlPositionTypeRight;
        //是否自动启动轮播
        _bbView.infiniteLoop = YES;
    }
    return  _bbView;
}
-(NSMutableArray *)dataArray{
    if (!_dataArray){
        _dataArray = [[NSMutableArray alloc]init];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self loadData];
}
-(void)loadData{
    [FindModel requestFindBannerData:^(NSArray *callArray, NSArray *firstArray, NSArray *bannerArray, NSError *error) {
            self.bbView.imageURLArray = bannerArray;
            [self.dataArray addObject:firstArray];
            [self.dataArray addObject:callArray];
            [self.contentView reloadData];
    }];
    [SecondItemListModel requestFindSecondItemListData:^(NSArray *imageArray, NSError *error) {
            self.aaView.imageURLArray = imageArray;
            [self.contentView reloadData];
    }];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return [self.dataArray count];
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    NSArray * arr = self.dataArray[section];
    return [arr count];
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellID = @"FindCell";
    FindCell * cell = [_contentView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    NSArray * array = self.dataArray[indexPath.section];
    FindModel * model = array[indexPath.row];
    cell.titleLabel.text = model.title;
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:model.image]];
    return cell;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(SCREEN_W / 2 - 1, SCREEN_W / 2 - 1);
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(SCREEN_W, 230);
}
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    FindReusableView * header = [_contentView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"FindReusableView" forIndexPath:indexPath];
    if (indexPath.section == 0){
        [header addSubview:_aaView];
    }if (indexPath.section == 1){
        [header addSubview:_bbView];
//     [header.headerView addSubview:_bbView]; 错误写法!!!!!!!!!!
    }
    return header;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0){
        if (indexPath.item == 0){
            TopViewController *TopVC = [[TopViewController alloc]init];
            [self.navigationController pushViewController:TopVC animated:YES];
        }else if (indexPath.item == 1){
            TopicViewController *TopicVC = [[TopicViewController alloc]init];
            [self.navigationController pushViewController:TopicVC animated:YES];
        }
    } else if (indexPath.section == 1){
        FindSecondViewController * FVC = [[FindSecondViewController alloc]init];
        FVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:FVC animated:YES];
        NSArray * array = self.dataArray[indexPath.section];
        FindModel * model = array[indexPath.row];
        FVC.navigationItem.title = model.title;
        _categoryId = model.Id;
        [FindSecondModel requestFindSecondData:self.categoryId callBack:^(NSArray *array, NSArray *imageArray, NSArray *webArray, NSError *error) {
            [FVC.dataArray addObject:array];
            [FVC.imageArray addObject:imageArray];
            [FVC.tableView reloadData];
        }];
    }
}
@end











