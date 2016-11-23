//
//  JingXuanViewController.m
//  EveryVideoDay
//
//  Created by MS on 16/10/11.
//  Copyright © 2016年 一杯清火茶. All rights reserved.
//

#import "JingXuanViewController.h"
#import "SectionListModelDic.h"
#import "FirstCell.h"
#import "TitleCell.h"
#import "ImageCell.h"
#import "SectionListModel+NetWorkManager.h"
#import "TableHeaderView.h"
#import "XJItemModelDic.h"

@interface JingXuanViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) SectionListModelDic * FistCellDataDic; // 存放第一个cell 的数据
@property (nonatomic, strong) NSMutableArray * upDataArr; // 存放上面的数据源
@property (nonatomic, strong) NSMutableArray * downDataArr; // 存放下面的数据源
@property (nonatomic, strong) TableHeaderView * headView;
@property (nonatomic, strong) NSMutableArray * totalDataArr; // 总的数据源
@property (nonatomic, assign) NSInteger page;
@property (nonatomic, strong) UIView * footerView;
@property (nonatomic, strong) SectionListModelDic * footerDataDic;
@end

@implementation JingXuanViewController

#pragma mark - 懒加载


- (UITableView *)tableView{
    if (!_tableView){
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_W, SCREEN_H - 64 - 49) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _headView = [[TableHeaderView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W, _FistCellDataDic.secItemListArr.count * 300 + 50)];
        _headView.delegate = self;
        _headView.backgroundColor = [UIColor clearColor];
        _headView.dataDic = _FistCellDataDic;
        _tableView.tableHeaderView = _headView;
        
        //尾视图
        _footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W, 50)];
        UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, 10, SCREEN_W, 30)];
        label.text = @"没有更多";
        label.textAlignment = NSTextAlignmentCenter;
        [_footerView addSubview:label];
        _footerView.backgroundColor = [UIColor clearColor];
        _tableView.tableFooterView = _footerView;
        
        [_tableView registerNib:[UINib nibWithNibName:@"TitleCell" bundle:nil] forCellReuseIdentifier:@"TitleCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"ImageCell" bundle:nil] forCellReuseIdentifier:@"ImageCell"];
        _tableView.backgroundColor = [UIColor clearColor];
        // 指定代理, 注册cell
        
        _tableView.footer = [MJRefreshAutoFooter footerWithRefreshingBlock:^{
            _page += 1;
            [self loadDownData];
        }];
        
        _tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            self.page = 1;
            [self loadUpData];
        }];
        
        
        _tableView.userInteractionEnabled = true;
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (NSMutableArray *)upDataArr{
    if (!_upDataArr){
        _upDataArr = [NSMutableArray array];
    }
    return _upDataArr;
}

- (NSMutableArray *)downDataArr{
    if (!_downDataArr){
        _downDataArr = [NSMutableArray array];
    }
    return _downDataArr;
}

- (SectionListModelDic *)FistCellDataArr{
    if (!_FistCellDataDic){
        _FistCellDataDic = [[SectionListModelDic alloc]init];
    }
    return _FistCellDataDic;
}



- (NSMutableArray *)totalDataArr{
    
    if (!_totalDataArr){
        _totalDataArr = [NSMutableArray array];
    }
    return _totalDataArr;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = false;
    self.view.backgroundColor = [UIColor whiteColor];
    self.page = 1;
    [self loadUpData];
    
    
}

#pragma mark - 网络请求
- (void)loadUpData{
    //    http://baobab.wandoujia.com/api/v3/tabs/selected?_s=7ab0f8d25c3cef6ee3aec03da72a1143&f=iphone&net=wifi&p_product=EYEPETIZER_IOS&u=843e5559476fa559a979a5ed6bee2a88e115cb27&v=2.7.0&vc=1305
#pragma mark - 加载上面视图的数据
    [HDManager startLoading];// 上面的开始网络请求
    NSDictionary * upPara = @{@"_s":@"7ab0f8d25c3cef6ee3aec03da72a1143",@"f":@"iphone",@"p_product":@"EYEPETIZER_IOS",@"u":@"843e5559476fa559a979a5ed6bee2a88e115cb27",@"v":@"2.7.0",@"vc":@"1305"};
    [SectionListModel requestSectionListDataWithPara:upPara callBack:^(NSArray *array, NSError *error) {
        if (error == nil){
            
            if (self.page == 1){
                self.upDataArr = nil;
                self.FistCellDataDic = nil;
                self.downDataArr = nil;
                self.totalDataArr = nil;
            }
            
            // array 里面的每一个元素是一个字典  SectionListModelDic
            self.FistCellDataDic = array.firstObject; //
            //            NSLog(@"第一个元素的类型:type - %@ actionUrl - %@, text - %@,多少个图片 - %ld",self.FistCellDataDic.type,self.FistCellDataDic.actionUrl,self.FistCellDataDic.footertext,self.FistCellDataDic.secItemListArr.count);
            NSMutableArray * UpArray = [NSMutableArray arrayWithArray:array]; // 移除以第一元素
            [UpArray removeObjectAtIndex:0];
            [self.upDataArr addObjectsFromArray:UpArray];
            [self.totalDataArr addObjectsFromArray:_upDataArr];
            [self loadDownData];
            
            [self.tableView reloadData];
            [self.tableView.header endRefreshing];
        }
        [HDManager stopLoading];
    }];
}


- (void)loadNextData{
    
    [HDManager startLoading]; // 开始加载
    NSDictionary * downPara = @{@"pagination":[NSNumber numberWithInteger:self.page],@"needFilter":@"true",@"f":@"iphone",@"p_product":@"EYEPETIZER_IOS",@"v":@"2.7.0",@"vc":@"1305"};
    [SectionListModel requestSectionListDataWithPara:downPara callBack:^(NSArray *array, NSError *error) {
        if (error == nil){
            [self.downDataArr addObjectsFromArray:array];
            [self.totalDataArr addObjectsFromArray:self.downDataArr];
            [self.tableView reloadData];
            [self.tableView.footer endRefreshing];
        }
        [HDManager stopLoading];
    }];
    
    
}



#pragma mark - 加载下面视图的数据
- (void)loadDownData{
    if (self.page >= 3){
        [self.tableView.footer endRefreshing];
        return ;
    }
    [HDManager startLoading]; // 开始加载
    NSDictionary * downPara = @{@"pagination":[NSNumber numberWithInteger:self.page],@"needFilter":@"true",@"f":@"iphone",@"p_product":@"EYEPETIZER_IOS",@"v":@"2.7.0",@"vc":@"1305"};
    [SectionListModel requestSectionListDataWithPara:downPara callBack:^(NSArray *array, NSError *error) {
        if (error == nil){
            [self.downDataArr addObjectsFromArray:array];
            [self.totalDataArr addObjectsFromArray:self.downDataArr];
            [self.tableView reloadData];
            [self.tableView.footer endRefreshing];
        }
        [HDManager stopLoading];
    }];
    
}

#pragma mark - UITableView 协议方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //    return (self.upDataArr.count + self.downDataArr.count);
    //    NSLog(@"多少个数据:%ld",self.upDataArr.count);
    return self.totalDataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * tableCellID = @"";
    
    // 取数据模型
    SectionListModelDic * dataDic = self.totalDataArr[indexPath.row]; // 最外层是一个字典
    ItemListModelArr * model = dataDic.secItemListArr.firstObject; // 里层是  ItemListModelArr
    // ItemListModelArr 里面是 XJItemModelDic 字典
    if (model.cover != [NSNull null]){
        tableCellID = @"ImageCell";
        ImageCell * cell = [tableView dequeueReusableCellWithIdentifier:tableCellID forIndexPath:indexPath];
        cell.delegate = self;
        [cell.coverImageView sd_setImageWithURL:[NSURL URLWithString:model.cover]];
        cell.dataDic = model;
        [cell.collectionView reloadData];
        return cell;
    }else{
        tableCellID = @"TitleCell";
        TitleCell * cell = [tableView dequeueReusableCellWithIdentifier:tableCellID forIndexPath:indexPath];
        cell.delegate = self;
        cell.titleL.text = model.title;
        cell.subTitleL.text = model.subTitle;
        cell.dataDic = model;
        [cell.collectionView reloadData];
        return cell;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 300;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    
    
    
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
}




#pragma mark - push代理协议

- (void)pushViewController:(XJCollectionViewController *)viewController{
    [self.navigationController pushViewController:viewController animated:true];
}


- (void)pushViewImageController:(ImageController *)viewController{
    [self.navigationController pushViewController:viewController animated:true];
}

- (void)pushViewTitleController:(ImageController *)viewController{
    [self.navigationController pushViewController:viewController animated:true];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
