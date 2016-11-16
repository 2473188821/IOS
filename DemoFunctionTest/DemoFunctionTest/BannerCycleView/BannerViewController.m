//
//  BannerViewController.m
//  DemoFunctionTest
//
//  Created by Chenfy on 16/11/16.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#import "BannerViewController.h"
#import "BannerScrollView.h"
#import "CycleScrollView.h"

@interface BannerViewController ()<BannerViewDelegate,CycleScrollViewDelegate>
@property(nonatomic,strong)BannerScrollView *banner;

@end

@implementation BannerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
    UIImage *m1 = [UIImage imageNamed:@"1.jpg"];
    UIImage *m2 = [UIImage imageNamed:@"2.jpg"];
    UIImage *m3 = [UIImage imageNamed:@"3.jpg"];
    UIImage *m4 = [UIImage imageNamed:@"4.jpg"];
    //UICollectionView实现
    CycleScrollView *scrollView = [[CycleScrollView alloc] initWithFrame:CGRectMake(0, 50, SCREEN_WIDTH,200)];
    scrollView.delegate = self;
    scrollView.duringTime = 2.0;
    [scrollView setImages:@[m1, m2,m3,m4]];
    [self.view addSubview:scrollView];
    
    //UIScrollView实现
    _banner = [[BannerScrollView alloc]initWithFrame:CGRectMake(0, 300, SCREEN_WIDTH, 200)];
    [self.view addSubview:_banner];
    [_banner setArrayImages:@[m1,m2,m3,m4]];
    _banner.delegate = self;
    [_banner startCycleView];
    // Do any additional setup after loading the view.
}
-(void)cycleScrollView:(CycleScrollView *)scrollView clicked:(NSInteger)index {
    
}

- (void)bannerViewClicked:(int)index {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
