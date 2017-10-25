//
//  ViewController.m
//  LXYFilterImageView
//
//  Created by lxy on 2017/10/24.
//  Copyright © 2017年 lxy. All rights reserved.
//

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
    mainCollectionView.imCurrent = ivCurrent.image;
    mainCollectionView.delegate = self;
    [self.view addSubview:mainCollectionView];



}

-(void)clickWithFilterImg:(UIImage *)img{

    ivCurrent.image  = img;
}


@end
