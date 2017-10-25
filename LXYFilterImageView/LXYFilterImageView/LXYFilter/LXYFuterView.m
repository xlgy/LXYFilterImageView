//
//  LXYFuterView.m
//  LXYFilterImageView
//
//  Created by lxy on 2017/10/24.
//  Copyright © 2017年 lxy. All rights reserved.
//

#import "LXYFuterView.h"
#import "UIView+Frame.h"


@implementation LXYFuterView

#define SCREEN_W [UIScreen mainScreen].bounds.size.width
#define SCREEN_H [UIScreen mainScreen].bounds.size.height


- (instancetype)init {
    self = [super init];

    if (self) {
        [self bindModel];
        [self binView];

    }
    return self;
}


-(void)binView{


    self.frame = CGRectMake(0, SCREEN_H - 100, SCREEN_W, 100);
    self.scvButton.frame = CGRectMake(0, 0, SCREEN_W, 100);
    [self addSubview:self.scvButton];


    CGFloat x = 10;
    for (int i=0; i<self.arrFilter.count; i++) {

        UIButton *btn = [UIButton new];
        btn.tag = i;
        btn.frame = CGRectMake(x, 10, 80, 80);
        [btn addTarget:self action:@selector(chooseAction:) forControlEvents:UIControlEventTouchUpInside];

        NSString *filterName = [self.arrFilter objectAtIndex:i];
        [btn setImage:[UIImage imageNamed:filterName] forState:UIControlStateNormal];
        [self.scvButton addSubview:btn];
        x = btn.right + 10;
    }

    self.scvButton.contentSize = CGSizeMake(x, 100);


}

-(void)bindModel{

    self.arrFilter = @[
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
                       @"CIVignetteEffect"];
}

-(void)chooseAction:(UIButton *)btn {

    UIImage *imgResult = [self imageWithImage:self.imCurrent WithFilterName:[self.arrFilter objectAtIndex:btn.tag]];

    [self.delegate clickWithFilterImg:imgResult];

}

-(UIImage *)imageWithImage:(UIImage *)image WithFilterName:(NSString *)filterName {



    [CIFilter filterNamesInCategory:kCICategoryBuiltIn];



    //将image转换成CIImage;
    CIImage *inputImage = [CIImage imageWithCGImage:image.CGImage];

    //创建滤镜
    CIFilter *filter = [CIFilter filterWithName:filterName
                                  keysAndValues:kCIInputImageKey ,inputImage, nil];

    //已有的值不变，其他设置为默认值
    [filter setDefaults];

    //输出渲染之后的CIImage
    CIImage *outImage = filter.outputImage;
    //创建绘制的上下文
    CIContext *context = [CIContext contextWithOptions:nil];

//    CIContext *context = [CIContext contextWithOptions:[NSDictionary dictionaryWithObject:[NSNumber numberWithBool:YES] forKey:kCIContextUseSoftwareRenderer]];//CPU渲染
    //创建像素位图
    CGImageRef resultImage = [context createCGImage:outImage fromRect:outImage.extent];

    UIImage *rImg = [UIImage imageWithCGImage:resultImage];


    return rImg;

}

- (UIScrollView *)scvButton {
    if (!_scvButton) {
        _scvButton = [UIScrollView new];

    }
    return _scvButton;
}


@end
