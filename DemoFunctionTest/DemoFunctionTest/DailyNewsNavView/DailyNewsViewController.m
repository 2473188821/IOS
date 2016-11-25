//
//  DailyNewsViewController.m
//  DemoFunctionTest
//
//  Created by Chenfy on 16/11/25.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#import "DailyNewsViewController.h"
#import "NewsNavigationView.h"

@interface DailyNewsViewController ()<NewsNavDelegate>

@end

@implementation DailyNewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
#pragma mark--button create
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 300, 100, 50);
    btn.backgroundColor = [UIColor orangeColor];
    [btn addTarget:self action:@selector(clicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    // Do any additional setup after loading the view.
}

- (void)clicked:(UIButton *)sender {
    NewsNavigationView *navView = [[NewsNavigationView alloc]initWithFrame:CGRectMake(0, 100, SCREEN_WIDTH, 40)];
    navView.delegate = self;
    navView.id = @"123";
    [self.view addSubview:navView];
}
- (void)newsNavClicked:(NewsNavigationView *)navView type:(NewsNavType)type {
    
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
