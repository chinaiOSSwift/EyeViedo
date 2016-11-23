//
//  VideoCell.h
//  EveryVideoDay
//
//  Created by MS on 16/10/17.
//  Copyright © 2016年 一杯清火茶. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AllDataModel.h"

@interface VideoCell : UITableViewCell<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

//


@property (nonatomic,strong) AllDataModel * collectionArr;

@property (weak, nonatomic) IBOutlet UIImageView *icon;

@property (weak, nonatomic) IBOutlet UILabel *title;

@property (weak, nonatomic) IBOutlet UILabel *subTitle;

@property (weak, nonatomic) IBOutlet UILabel *Description;


@end
