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

@property (nonatomic, strong) NSString *filterTypeName; //滤镜名字

/**
 * 
 官方滤镜类型
 @"CIColorCrossPolynomial",
 @"CIColorCube",
 @"CIColorCubeWithColorSpace",
 @"CIColorInvert",
 @"CIColorMonochrome",
 @"CIColorPosterize",
 @"CIFalseColor",
 @"CIMaximumComponent",
 @"CIMinimumComponent",
 @"CIPhotoEffectChrome",
 @"CIPhotoEffectFade",
 @"CIPhotoEffectInstant",
 @"CIPhotoEffectMono",
 @"CIPhotoEffectNoir",
 @"CIPhotoEffectProcess",
 @"CIPhotoEffectTonal",
 @"CIPhotoEffectTransfer",
 @"CISepiaTone",
 @"CIVignette",
 @"CIVignetteEffect"
 */
@property (nonatomic, strong) UIImage  *imgPlaceHolder; //选择预览图

- (instancetype)initWithFilterTypeName:(NSString *)filterTypeName WithPlaceHoderImg:(UIImage *)placeHoderImg;

@end
