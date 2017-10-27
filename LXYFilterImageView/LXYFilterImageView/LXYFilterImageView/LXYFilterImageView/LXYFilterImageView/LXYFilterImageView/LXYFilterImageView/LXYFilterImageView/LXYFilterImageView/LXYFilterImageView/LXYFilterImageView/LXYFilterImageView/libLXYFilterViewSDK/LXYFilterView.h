//
//  LXYFuterView.h
//  LXYFilterImageView
//
//  Created by lxy on 2017/10/24.
//  Copyright © 2017年 lxy. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol LXYFilterViewDelegate <NSObject>

-(void)clickWithFilterImg:(UIImage *)img;

@end

@interface LXYFilterView : UIView <UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>


@property (nonatomic, strong) NSMutableArray *arrFilter;//滤镜样式数组

/**
 *
 官方滤镜类型
 @"CIColorCubeWithColorSpace",//自然
 @"CIColorInvert",//底片
 @"CIColorMonochrome",//暗黄
 @"CIColorPosterize",//海报
 @"CIFalseColor",//怀旧
 @"CIMaximumComponent",//强白
 @"CIMinimumComponent",//弱白
 @"CIPhotoEffectChrome",//鲜艳
 @"CIPhotoEffectFade",//褪色
 @"CIPhotoEffectInstant",//黄昏
 @"CIPhotoEffectMono",//单色
 @"CIPhotoEffectNoir",//阴暗
 @"CIPhotoEffectProcess",//转色
 @"CIPhotoEffectTonal",//灰蒙
 @"CIPhotoEffectTransfer",//弱光
 @"CISepiaTone",//黄旧
 @"CIVignette"//光亮
 */

@property (nonatomic, strong) UIImage *imCurrent;//原始图片



@property (nonatomic,weak)id<LXYFilterViewDelegate>delegate;

@end
