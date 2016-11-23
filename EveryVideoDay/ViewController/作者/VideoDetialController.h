//
//  VideoDetialController.h
//  EveryVideoDay
//
//  Created by MS on 16/10/19.
//  Copyright © 2016年 一杯清火茶. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VideoDetialController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *coverDetail;
@property (weak, nonatomic) IBOutlet UILabel *cellTitle;
@property (weak, nonatomic) IBOutlet UILabel *cellCategory;
@property (weak, nonatomic) IBOutlet UILabel *cellDuration;
@property (weak, nonatomic) IBOutlet UIImageView *authorIcon;
@property (weak, nonatomic) IBOutlet UILabel *authorName;
@property (weak, nonatomic) IBOutlet UILabel *authorVideoNum;
@property (weak, nonatomic) IBOutlet UILabel *authorDetail;
@property (weak, nonatomic) IBOutlet UILabel *videoDetail;
@property (weak, nonatomic) IBOutlet UILabel *likeNum;
@property (weak, nonatomic) IBOutlet UILabel *shareNum;
@property (weak, nonatomic) IBOutlet UILabel *pinglunNum;

- (IBAction)videoBtn:(UIButton *)sender;
- (IBAction)fanHui:(UIButton *)sender;


@property (nonatomic,copy) NSString * cover;
@property (nonatomic,copy) NSString * cell_title;
@property (nonatomic,copy) NSString * cell_category;
@property (nonatomic,copy) NSString * cell_duration;
@property (nonatomic,copy) NSString * author_icon;
@property (nonatomic,copy) NSString * author_name;
@property (nonatomic,copy) NSString * author_videonum;
@property (nonatomic,copy) NSString * author_detail;
@property (nonatomic,copy) NSString * video_detail;
@property (nonatomic,copy) NSString * like_num;
@property (nonatomic,copy) NSString * share_num;
@property (nonatomic,copy) NSString * pinglun_num;
@property (nonatomic,copy) NSString * playUrl;

@end
