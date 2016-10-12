//
//  ViewController.m
//  JSPatchLoaderTets
//
//  Created by Chenfy on 16/9/1.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#import "ViewController.h"

/*
 *屏幕尺寸参数
 */
#define SCREEN_WIDTH        [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT       [UIScreen mainScreen].bounds.size.height

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    int x = (SCREEN_WIDTH - 200)/2;
    
    UIButton *btn  = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(x, 100, 200, 50);
    btn.backgroundColor = [UIColor purpleColor];
    [btn setTitle:@"JSPatch Update！" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];

    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)buttonClicked {
    UIView *vv = [self genView];
    [self.view addSubview:vv];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(viewTapped)];
    [vv addGestureRecognizer:tap];
}

- (void)viewTapped {
    NSLog(@"View tapped!");
}

- (UIView *)genView {
    UIView *v = [[UIView alloc]initWithFrame:CGRectMake(0, 200, SCREEN_WIDTH, 50)];
    v.backgroundColor = [UIColor orangeColor];
    return v;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
