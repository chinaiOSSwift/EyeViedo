//
//  FindThirdViewController.h
//  EveryVideoDay
//
//  Created by qianfeng on 16/10/15.
//  Copyright © 2016年 一杯清火茶. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FindThirdViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *BlurredImage;
@property (weak, nonatomic) IBOutlet UIImageView *DetialView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *categoryLabel;
@property (weak, nonatomic) IBOutlet UILabel *releaseTimeLable;
@property (weak, nonatomic) IBOutlet UIButton *playBtn;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

@property (nonatomic,strong) NSString * FTCTitle;
@property (nonatomic,strong) NSString * FTCCategory;
@property (nonatomic,strong) NSString * FTCReleaseTime;
@property (nonatomic,strong) NSString * FTCDescription;
@property (nonatomic,strong) NSString * FTCDetialview;
@property (nonatomic,strong) NSString * FTCPlayUrl;
@property (nonatomic,strong) NSString * FTCblurred;
@property (nonatomic,strong) NSMutableArray * imageArray;
@property (nonatomic,strong) NSMutableArray * dataArray;
@property (nonatomic,strong) NSMutableArray * webArray;
@property (nonatomic, copy) NSString * Id;

@end
