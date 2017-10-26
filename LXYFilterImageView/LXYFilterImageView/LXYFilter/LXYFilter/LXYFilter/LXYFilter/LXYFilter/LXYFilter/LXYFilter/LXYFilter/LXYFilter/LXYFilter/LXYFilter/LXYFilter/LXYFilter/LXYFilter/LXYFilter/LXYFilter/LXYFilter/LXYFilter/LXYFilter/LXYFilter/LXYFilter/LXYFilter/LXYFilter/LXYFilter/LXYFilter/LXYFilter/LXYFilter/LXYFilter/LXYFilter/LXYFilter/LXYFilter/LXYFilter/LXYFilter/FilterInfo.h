//
//  FilterInfo.h
//  LXYFilterImageView
//
//  Created by lxy on 2017/10/26.
//  Copyright © 2017年 lxy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FilterInfo : NSObject

@property (nonatomic, strong) NSString *filterTypeName;
@property (nonatomic, strong) UIImage  *imgPlaceHolder;

- (instancetype)initWithFilterTypeName:(NSString *)filterTypeName WithPlaceHoderImg:(UIImage *)placeHoderImg;

@end
