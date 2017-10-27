//
//  LXYFuterView.m
//  LXYFilterImageView
//
//  Created by lxy on 2017/10/24.
//  Copyright © 2017年 lxy. All rights reserved.
//

#import "LXYFilterView.h"
#import "UIView+Frame.h"

#import "MyCollectionViewCell.h"
#import "SVProgressHUD.h"


@interface LXYFilterView ()


@property (nonatomic, strong) CIImage *inputImage;
@property (nonatomic, strong) CIFilter *filter;
@property (nonatomic, strong) CIImage *outImage;
@property (nonatomic, strong) CIContext *context;
@property (nonatomic, assign) CGImageRef resultImage;
@property (nonatomic, strong) UICollectionView *mainCollectionView;
@property (nonatomic, strong) NSDictionary *dicFilters;



@end

@implementation LXYFilterView

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

    self.frame = CGRectMake(0, SCREEN_H - 130, SCREEN_W, 130);

    //1.初始化layout
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    //设置collectionView滚动方向
    [layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    //设置headerView的尺寸大小
    //layout.headerReferenceSize = CGSizeMake(self.view.frame.size.width, 100);
    //该方法也可以设置itemSize
    layout.itemSize =CGSizeMake(110, 150);

    //2.初始化collectionView
    self.mainCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, 130)collectionViewLayout:layout];
    [self addSubview:self.mainCollectionView];
    self.mainCollectionView.backgroundColor = [UIColor clearColor];

    //3.注册collectionViewCell
    //注意，此处的ReuseIdentifier 必须和 cellForItemAtIndexPath 方法中 一致 均为 cellId
    [self.mainCollectionView registerClass:[MyCollectionViewCell class] forCellWithReuseIdentifier:@"cellId"];

    //注册headerView  此处的ReuseIdentifier 必须和 cellForItemAtIndexPath 方法中 一致  均为reusableView
    [self.mainCollectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"reusableView"];

    self.mainCollectionView.showsHorizontalScrollIndicator = FALSE;

    //4.设置代理
    self.mainCollectionView.delegate = self;
    self.mainCollectionView.dataSource = self;

}

-(void)bindModel{


    NSArray *arrString = @[
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
                           @"CIVignette"];//光亮

    self.dicFilters = @{ @"CIColorCubeWithColorSpace":@"自然",//自然
                         @"CIColorInvert":@"底片",//底片
                         @"CIColorMonochrome":@"暗黄",//暗黄
                         @"CIColorPosterize":@"海报",//海报
                         @"CIFalseColor":@"怀旧",//怀旧
                         @"CIMaximumComponent":@"强白",//强白
                         @"CIMinimumComponent":@"弱白",//弱白
                         @"CIPhotoEffectChrome":@"鲜艳",//鲜艳
                         @"CIPhotoEffectFade":@"褪色",//褪色
                         @"CIPhotoEffectInstant":@"黄昏",//黄昏
                         @"CIPhotoEffectMono":@"单色",//单色
                         @"CIPhotoEffectNoir":@"阴暗",//阴暗
                         @"CIPhotoEffectProcess":@"转色",//转色
                         @"CIPhotoEffectTonal":@"灰蒙",//灰蒙
                         @"CIPhotoEffectTransfer":@"弱光",//弱光
                         @"CISepiaTone":@"黄旧",//黄旧
                         @"CIVignette":@"光亮"};//光亮

    self.arrFilter = [NSMutableArray arrayWithArray:arrString];


}

-(void)setArrFilter:(NSArray *)arrFilter {

    _arrFilter = [NSMutableArray arrayWithArray:arrFilter];

    [self.mainCollectionView reloadData];
}

-(UIImage *)imageWithImage:(UIImage *)image WithFilterName:(NSString *)filterName {


    //将image转换成CIImage;
    _inputImage = [CIImage imageWithCGImage:image.CGImage];

    //创建滤镜
    _filter = [CIFilter filterWithName:filterName
                                  keysAndValues:kCIInputImageKey ,_inputImage, nil];

    //已有的值不变，其他设置为默认值
    [_filter setDefaults];

    //输出渲染之后的CIImage
    _outImage = _filter.outputImage;
    //创建绘制的上下文
    CIContext *context = [CIContext contextWithOptions:nil];

//    CIContext *context = [CIContext contextWithOptions:[NSDictionary dictionaryWithObject:[NSNumber numberWithBool:YES] forKey:kCIContextUseSoftwareRenderer]];//CPU渲染
    //创建像素位图
     _resultImage = [context createCGImage:_outImage fromRect:_outImage.extent];

    UIImage *rImg = [UIImage imageWithCGImage:_resultImage];

    _inputImage = nil;
    _filter = nil;
    _outImage = nil;
    _context = nil;
    _resultImage = nil;




    return rImg;

}


#pragma mark collectionView代理方法
//返回section个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

//每个section的item个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.arrFilter.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    MyCollectionViewCell *cell = (MyCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"cellId" forIndexPath:indexPath];
    NSString *filterName = [self.arrFilter objectAtIndex:indexPath.row];

    cell.topImage.image = self.imCurrent;
    cell.botlabel.text = [self.dicFilters objectForKey:filterName];

    cell.backgroundColor = [UIColor lightGrayColor];

    return cell;
}

//设置每个item的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {

    return CGSizeMake(110, 100);
}


//设置每个item的UIEdgeInsets
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {

    return UIEdgeInsetsMake(10, 2, 10, 2);
}

//设置每个item水平间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {

    return 10;
}


//设置每个item垂直间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {

    return 10;
}


//点击item方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {

    [SVProgressHUD show];
    NSString *stFilter = [self.arrFilter objectAtIndex:indexPath.row];

    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(imageMackAction:) object:stFilter];

    [thread start];

}

- (void)imageMackAction:(NSString *)stFilter{

    UIImage *imgResult = [self imageWithImage:self.imCurrent WithFilterName:stFilter];

    [self.delegate clickWithFilterImg:imgResult];
    imgResult = nil;
    [SVProgressHUD dismiss];

}

@end
