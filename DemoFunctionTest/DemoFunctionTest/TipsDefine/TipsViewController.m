//
//  TipsViewController.m
//  DemoFunctionTest
//
//  Created by Chenfy on 17/1/3.
//  Copyright © 2017年 Chenfy. All rights reserved.
//

#import "TipsViewController.h"
#import "TipsView.h"

@interface TipsViewController ()

@end

@implementation TipsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
#pragma mark--button create
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 100, 50);
    btn.backgroundColor = [UIColor orangeColor];
    [btn addTarget:self action:@selector(clicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    // Do any additional setup after loading the view.
}
- (void)clicked {
    [TipsView showTitle:@"标题" message:@"消息内容！"];
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
