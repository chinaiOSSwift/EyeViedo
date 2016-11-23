//
//  AuthorViewController.m
//  EveryVideoDay
//
//  Created by MS on 16/10/11.
//  Copyright © 2016年 一杯清火茶. All rights reserved.
//

#import "AuthorViewController.h"

#import "AllDataModel+AllDataModelNetWork.h"
#import "AllDataModel.h"


#import "TextCell.h"
#import "VideoCell.h"
#import "AuthorCell.h"

#import "AuthorView.h"


//第二个netWork
#import "AuthorCellModel.h"



@interface AuthorViewController ()<UITableViewDelegate,UITableViewDataSource>
//
@property(nonatomic,strong) UITableView * tableView;
@property (nonatomic,strong) NSMutableArray * AllDataArr;
@property (nonatomic,strong) NSMutableArray * CollectionArr;

//
@property (nonatomic,strong) UILabel *hotLabel;
@property (nonatomic,strong) UILabel *updateLabel;
@property (nonatomic,strong) UILabel *allLabel;

@end

@implementation AuthorViewController

#pragma mark - 懒加载
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H) style:UITableViewStylePlain];
        [_tableView registerNib:[UINib nibWithNibName:@"AuthorCell" bundle:nil] forCellReuseIdentifier:@"AuthorCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"TextCell" bundle:nil] forCellReuseIdentifier:@"TextCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"VideoCell" bundle:nil] forCellReuseIdentifier:@"VideoCell"];
        self.tableView.showsVerticalScrollIndicator = NO;//隐藏滚动条
        [self.view addSubview:_tableView];
        self.navigationItem.title = @"作者";
    }
    return _tableView;
}

-(NSMutableArray *)AllDataArr{
    if (!_AllDataArr) {
        _AllDataArr  = [[NSMutableArray alloc]init];
    }
    return _AllDataArr;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

-(void)loadData{

    [AllDataModel requestAllData:^(NSArray *AllDataArray, NSArray *CollectionArr, NSError *error) {
        if (error == nil) {
            [self.AllDataArr addObjectsFromArray:AllDataArray];
            [self.CollectionArr addObjectsFromArray:CollectionArr];

//            _tableView.delegate = self;
//            _tableView.dataSource = self;
            [self.tableView reloadData];
        }else{
            NSLog(@"出现错误");
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView 协议方法

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.AllDataArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString * AuthorCellID = @"AuthorCell";
    static NSString * VideoCellID = @"VideoCell";
    static NSString * TextCellID = @"TextCell";
    
    
    AllDataModel * model = self.AllDataArr[indexPath.row];
    if ([model.dataType isEqualToString:@"LeftAlignTextHeader"]) {
        TextCell * cell = [tableView dequeueReusableCellWithIdentifier:TextCellID forIndexPath:indexPath];
        cell.Text.text = model.text;
        return cell;
    }else if ([model.dataType isEqualToString:@"BriefCard"]){
        AuthorCell * cell = [tableView dequeueReusableCellWithIdentifier:AuthorCellID forIndexPath:indexPath];
        cell.title.text = model.title;
        cell.subTitle.text = model.subTitle;
        [cell.icon sd_setImageWithURL:[NSURL URLWithString:model.icon]];
        cell.Description.text = model.Description;
        return cell;
        
    }else if ([model.dataType isEqualToString:@"VideoCollection"]){
        VideoCell * cell = [tableView dequeueReusableCellWithIdentifier:VideoCellID forIndexPath:indexPath];
        cell.Description.text = model.Description;
        cell.title.text = model.vTitle;
        cell.subTitle.text = model.subTitle;
        [cell.icon sd_setImageWithURL:[NSURL URLWithString:model.icon]];
        return cell;
    }else {
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"qqq"];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"qqq"];
        }
        return cell;
    }
    
    //return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    AllDataModel * model = self.AllDataArr[indexPath.row];
    AuthorView * authorView = [[AuthorView alloc]init];
    if ([model.dataType isEqualToString:@"BriefCard"]){
        //
        [self.navigationController pushViewController:authorView animated:YES];
        authorView.pgcId = model.Id;
    }else if ([model.dataType isEqualToString:@"VideoCollection"]){
        [self.navigationController pushViewController:authorView animated:YES];
        authorView.pgcId = model.Id;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    CGFloat Height;
    
    AllDataModel * model = self.AllDataArr[indexPath.row];
    if ([model.dataType isEqualToString:@"LeftAlignTextHeader"]) {
        Height =  60;
    }else if ([model.dataType isEqualToString:@"BriefCard"]){
        Height = 80;
    }else if ([model.dataType isEqualToString:@"VideoCollection"]){
        Height = 80;
    }
    return Height;
}



@end





