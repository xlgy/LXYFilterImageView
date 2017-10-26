//
//  FilterInfo.m
//  LXYFilterImageView
//
//  Created by lxy on 2017/10/26.
//  Copyright © 2017年 lxy. All rights reserved.
//

#import "FilterInfo.h"

@implementation FilterInfo

- (instancetype)initWithFilterTypeName:(NSString *)filterTypeName WithPlaceHoderImg:(UIImage *)placeHoderImg {
    
    self = [super init];
    if (self) {

        _filterTypeName = filterTypeName;
        _imgPlaceHolder = placeHoderImg;

    }
    return self;
}

@end
