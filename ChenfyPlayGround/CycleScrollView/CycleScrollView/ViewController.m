//
//  ViewController.m
//  CycleScrollView
//
//  Created by Chenfy on 16/9/22.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#import "ViewController.h"
#import "CycleScrollView.h"

@interface ViewController ()<CycleScrollViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *m1 = [UIImage imageNamed:@"1.jpg"];
    UIImage *m2 = [UIImage imageNamed:@"2.jpg"];
    UIImage *m3 = [UIImage imageNamed:@"3.jpg"];
    UIImage *m4 = [UIImage imageNamed:@"4.jpg"];
    UIImage *m5 = [UIImage imageNamed:@"5.jpg"];
    CGSize sSize = [UIScreen mainScreen].bounds.size;

    CycleScrollView *scrollView2 = [[CycleScrollView alloc] initWithFrame:CGRectMake(0, 220, sSize.width, sSize.width * 504 / 1080.0)];
    scrollView2.delegate = self;
    scrollView2.duringTime = 2.0;
    [scrollView2 setImages:@[]];
    [scrollView2 setImages:@[m1, m2,m3,m4,m5]];

    [self.view addSubview:scrollView2];

    // Do any additional setup after loading the view, typically from a nib.
}

-(void)cycleScrollView:(CycleScrollView *)scrollView clicked:(NSInteger)index {
    NSLog(@"cc-:%ld",(long)index);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
