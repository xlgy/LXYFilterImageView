//
//  MyCollectionViewCell.m
//  滤镜Demo
//
//  Created by lxy on 2017/10/24.
//  Copyright © 2017年 lxy. All rights reserved.
//

#import "MyCollectionViewCell.h"

@implementation MyCollectionViewCell

- (id)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self){

        _topImage  = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 110, 110)];
        _topImage.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:_topImage];

        _botlabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 90, 110, 20)];
        _botlabel.textAlignment = NSTextAlignmentCenter;
        _botlabel.textColor = [UIColor whiteColor];
        _botlabel.font = [UIFont boldSystemFontOfSize:14];
        _botlabel.backgroundColor = [UIColor darkGrayColor];
        _botlabel.alpha = 0.8;
        [self.contentView addSubview:_botlabel];
    }

    return self;
}



@end
