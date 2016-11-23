//
//  FindReusableView.m
//  EveryVideoDay
//
//  Created by qianfeng on 16/10/14.
//  Copyright © 2016年 一杯清火茶. All rights reserved.
//

#import "FindReusableView.h"

@implementation FindReusableView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _headerView.frame = [self bounds];
        [self addSubview:_headerView];
        _headerView.backgroundColor = [UIColor cyanColor];
    }
    return self;
}
@end
