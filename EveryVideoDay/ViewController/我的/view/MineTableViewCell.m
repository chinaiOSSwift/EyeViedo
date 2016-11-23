//
//  MineTableViewCell.m
//  EveryVideoDay
//
//  Created by qianfeng on 16/10/19.
//  Copyright © 2016年 一杯清火茶. All rights reserved.
//

#import "MineTableViewCell.h"
#import "XJItemModelDic.h"

@interface MineTableViewCell()
@property (nonatomic,strong) UIImageView *icon;
@property (nonatomic,strong) UILabel *title;


@end


@implementation MineTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.icon = [[UIImageView alloc] init];
        self.icon.frame = CGRectMake(0, 0, SCREEN_W, 200);
        //_icon.center = CGPointMake(SCREEN_W / 2, 200);
        [self.contentView addSubview:_icon];
        self.title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, 200)];
        _title.center = CGPointMake(SCREEN_W / 2, 100);
        self.title.numberOfLines = 0;
        self.title.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_title];
    }
    return self;
}



- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)custom:(XJItemModelDic *)model{

    
    [self.icon sd_setImageWithURL:[[NSURL alloc] initWithString:model.detail]];
    self.title.text = model.title;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}

@end
