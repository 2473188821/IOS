//
//  ViewController.m
//  HotFixTest
//
//  Created by Chenfy on 16/8/29.
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
    
    
//    UIView *viewNav = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
//    viewNav.backgroundColor = [UIColor redColor];
//
//    UIButton *btnBack = [UIButton buttonWithType:UIButtonTypeCustom];
//    btnBack.frame = CGRectMake(0, 0, 100, 64);
//    [btnBack setTitle:@"返回" forState:UIControlStateNormal];
//    [btnBack addTarget:self action:@selector(backForward) forControlEvents:UIControlEventTouchUpInside];
//    [viewNav addSubview:btnBack];
//    [self.view addSubview:viewNav];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)backForward {
//    [self dismissViewControllerAnimated:YES completion:^{
//        
//    }];
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
