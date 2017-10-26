# LXYFilterImageView
图片滤镜封装控件

官方滤镜类型
```
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
