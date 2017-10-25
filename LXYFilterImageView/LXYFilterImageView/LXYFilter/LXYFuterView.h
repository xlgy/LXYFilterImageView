//
//  LXYFuterView.h
//  LXYFilterImageView
//
//  Created by lxy on 2017/10/24.
//  Copyright © 2017年 lxy. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol LXYFuterViewDelegate <NSObject>

-(void)clickWithFilterImg:(UIImage *)img;

@end

@interface LXYFuterView : UIView

@property (nonatomic, strong) NSArray *arrFilter;
@property (nonatomic, strong) UIScrollView *scvButton;
@property (nonatomic, strong) UIImage *imCurrent;

@property (nonatomic,weak)id<LXYFuterViewDelegate>delegate;

@end
