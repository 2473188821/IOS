//
//  CAGreadientViewController.m
//  DemoFunctionTest
//
//  Created by Chenfy on 16/12/9.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#import "CAGreadientViewController.h"
#import "CircleView.h"

@interface CAGreadientViewController ()

@property(nonatomic,strong)CircleView     *viewCircle;


@end

@implementation CAGreadientViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    int y = 60;
    
#pragma mark--button create
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(50, 30 + y, 100, 50);
    btn.backgroundColor = [UIColor orangeColor];
    [btn addTarget:self action:@selector(clicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];

    
    _viewCircle = [[CircleView alloc]initWithFrame:CGRectMake(60, 100 + y, 200, 200)];
    [_viewCircle startAnimation];
    [self.view addSubview:_viewCircle];
    // Do any additional setup after loading the view.
}

- (void)clicked:(UIButton *)sender {
    [_viewCircle stopAnimation];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [_viewCircle stopAnimation];
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
