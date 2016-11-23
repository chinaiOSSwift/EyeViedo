//
//  authorDetailCell.h
//  EveryVideoDay
//
//  Created by MS on 16/10/18.
//  Copyright © 2016年 一杯清火茶. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface authorDetailCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *icon;

@property (weak, nonatomic) IBOutlet UILabel *title;

@property (weak, nonatomic) IBOutlet UILabel *category;

@property (weak, nonatomic) IBOutlet UILabel *duration;


@end
