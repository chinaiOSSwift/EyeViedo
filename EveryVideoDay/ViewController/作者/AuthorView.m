//
//  AuthorView.m
//  EveryVideoDay
//
//  Created by MS on 16/10/18.
//  Copyright © 2016年 一杯清火茶. All rights reserved.
//

#import "AuthorView.h"
#import "AuthorCellModel.h"
#import "AuthorCellModel+AuthorCellModelNetWork.h"
#import "authorDetailCell.h"
#import "VideoDetialController.h"



@interface AuthorView ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,assign) NSInteger start;
@property (nonatomic,copy) NSString * strategy;

@property (nonatomic,strong) UIImageView * icon;
@property (nonatomic,strong) UILabel * authorTitle;
@property (nonatomic,strong) UILabel * name;

@property (nonatomic,strong) UIView * backView;

@property (nonatomic,strong) NSMutableArray * authorcellArr;
@property (nonatomic,strong) UITableView * tableView;
@property (nonatomic,strong) UIView * headerView;
@property (nonatomic,strong) UIButton * fanHuiBtn;
@end

@implementation AuthorView

-(NSString *)pgcId{
    if (!_pgcId) {
        _pgcId = [[NSString alloc]init];
    }
    return _pgcId;
}

-(NSMutableArray *)authorcellArr{
    if (!_authorcellArr) {
        _authorcellArr = [[NSMutableArray alloc]init];
    }
    return _authorcellArr;
}

-(UIView *)backView{
    if (!_backView) {
        _backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W, 210)];
        _backView.backgroundColor = [UIColor whiteColor];
    }
    return _backView;
}

-(UIView *)headerView{
    if (!_headerView) {
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W, 210)];
        _headerView.backgroundColor = [UIColor cyanColor];
        [_headerView addSubview:_backView];
    }
    return _headerView;
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 20, SCREEN_W, SCREEN_H) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerNib:[UINib nibWithNibName:@"authorDetailCell" bundle:nil] forCellReuseIdentifier:@"authorDetailCell"];
        [self.view addSubview:_tableView];
        _tableView.tableHeaderView = self.headerView;
        self.tableView.showsVerticalScrollIndicator = NO;//隐藏滚动条
    }
    return _tableView;
}

-(UIButton *)fanHuiBtn{
    if (!_fanHuiBtn) {
        _fanHuiBtn = [[UIButton alloc]init];
        //_fanHuiBtn addTarget:<#(nullable id)#> action:<#(nonnull SEL)#> forControlEvents:<#(UIControlEvents)#>
    }
    return _fanHuiBtn;
}

-(UIImageView *)icon{
    if (!_icon) {
        _icon = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_W / 2 - 30, 20, 60, 60)];
        _icon.layer.cornerRadius = _icon.mj_h / 2;
        _icon.clipsToBounds = YES;
    }
    return _icon;
}

-(UILabel *)name{
    if (!_name) {
        _name = [[UILabel alloc]initWithFrame:CGRectMake(0, 90, SCREEN_W, 40)];
        _name.textAlignment = UITextAlignmentCenter;
        _name.font = [UIFont boldSystemFontOfSize:17];
    }
    return _name;
}

-(UILabel *)authorTitle{
    if (!_authorTitle) {
        _authorTitle = [[UILabel alloc]initWithFrame:CGRectMake(30, 130, SCREEN_W - 60, 60)];
        _authorTitle.numberOfLines = 0;
        _authorTitle.font = [UIFont boldSystemFontOfSize:14];
    }
    return _authorTitle;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    [self createHeadView];
    self.navigationController.navigationBar.hidden = YES;
    self.tabBarController.tabBar.hidden = YES;
    
    self.fanHuiBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 30, 50, 30)];
    [self.fanHuiBtn addTarget:self action:@selector(popalkClick) forControlEvents:UIControlEventTouchUpInside];
    [self.backView addSubview:self.fanHuiBtn];
    [self.fanHuiBtn setImage:[UIImage imageNamed:@"返回1@2x.png"] forState:UIControlStateNormal];
}

- (void)popalkClick{
    [self.navigationController popToRootViewControllerAnimated:YES];
    self.navigationController.navigationBar.hidden = NO;
    self.tabBarController.tabBar.hidden = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)loadData{
    [AuthorCellModel requestAuthorCellData:self.pgcId callBack:^(NSArray *auhorCellArr, NSError *error) {
        for (AuthorCellModel * model in auhorCellArr) {
            [self.icon sd_setImageWithURL:[NSURL URLWithString:model.icon]];
            self.name.text = model.name;
            self.authorTitle.text = model.Description;
            [self.backView addSubview:self.icon];
            [self.backView addSubview:self.name];
            [self.backView addSubview:self.authorTitle];
            NSLog(@"qqqq%@",model);
        }
        [self.authorcellArr addObjectsFromArray:auhorCellArr];
        [self.tableView reloadData];
    }];
}

-(void)createHeadView{

}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"%ldbbb",self.authorcellArr.count);
    return self.authorcellArr.count;

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * authorDetailCellId = @"authorDetailCell";
    AuthorCellModel * model = self.authorcellArr[indexPath.row];
    authorDetailCell * cell = [tableView dequeueReusableCellWithIdentifier:authorDetailCellId forIndexPath:indexPath];
    [cell.icon sd_setImageWithURL:[NSURL URLWithString:model.iamge]];
    cell.title.text = model.title;
    cell.category.text = model.category;
    
    // cell.duration.text = model.Duration;//此行代码程序崩溃，下行不崩溃
   // cell.duration.text = [NSString stringWithFormat:@"%@",model.Duration];
    
     NSInteger min = model.Duration.integerValue / 60;
    NSInteger sec = model.Duration.integerValue % 60;
    cell.duration.text = [NSString stringWithFormat:@"%.2ld'%.2ld''",min,sec];

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    VideoDetialController * videoView = [[VideoDetialController alloc]init];
    [self.navigationController pushViewController:videoView animated:YES];
    AuthorCellModel * model = self.authorcellArr[indexPath.row];
    videoView.cover = model.iamge;
    videoView.cell_title = model.title;
    videoView.cell_category = model.category;
    NSInteger min = model.Duration.integerValue / 60;
    NSInteger sec = model.Duration.integerValue % 60;
    videoView.cell_duration =[NSString stringWithFormat:@"%.2ld'%.2ld''",min,sec];
    videoView.author_icon = model.icon;
    videoView.author_name = model.name;
    videoView.author_videonum = model.videoNum;
    videoView.video_detail = model.videoDescription;
    videoView.like_num = model.collectionCount;
    videoView.share_num = model.shareCount;
    videoView.pinglun_num = model.collectionCount;
    videoView.playUrl = model.playUrl;
    videoView.author_detail = model.Description;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 220;
}


@end





