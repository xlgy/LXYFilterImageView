# LXYFilterImageView
图片滤镜封装控件

官方滤镜类型
```
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
``` 
 
 
使用方式

```
mainCollectionView = [LXYFuterView new];
//设置需要操作的图片
mainCollectionView.imCurrent = ivCurrent.image;
//设置所需滤镜类型
mainCollectionView.arrFilter = filterArr;
mainCollectionView.delegate = self;
[self.view addSubview:mainCollectionView];

```

通过代理拿到生成图片

```
 -(void)clickWithFilterImg:(UIImage *)img{

    ivCurrent.image  = img;
}
```

 ![image](https://github.com/xlgy/LXYFilterImageView/blob/master/aa.png)
