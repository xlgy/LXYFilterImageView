# LXYFilterImageView
图片滤镜封装控件


使用实例：

#import "ViewController.h"
#import "LXYFuterView.h"


@interface ViewController ()<LXYFuterViewDelegate>{
LXYFuterView *mainCollectionView;
UIImageView *ivCurrent;
}

@property (nonatomic, strong) UIImageView *ivA;
@end

@implementation ViewController

- (void)viewDidLoad {
[super viewDidLoad];


ivCurrent = [UIImageView new];
ivCurrent.frame = CGRectMake(0, 20, self.view.bounds.size.width, 200);
ivCurrent.contentMode = UIViewContentModeScaleAspectFit;
ivCurrent.image = [UIImage imageNamed:@"demo.jpg"];
[self.view addSubview:ivCurrent];

mainCollectionView = [LXYFuterView new];
   //设置需要滤镜的图片
mainCollectionView.imCurrent = ivCurrent.image;
mainCollectionView.delegate = self;
[self.view addSubview:mainCollectionView];



}

-(void)clickWithFilterImg:(UIImage *)img{

  //取到滤镜生成的图片
   ivCurrent.image  = img;
}


@end