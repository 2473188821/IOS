//
//  ThirdViewController.m
//  ViewControllerAnimation
//
//  Created by Chenfy on 16/10/10.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    
    // Present
    UIButton *presentButton = [UIButton buttonWithType:UIButtonTypeSystem];
    presentButton.frame = CGRectMake(110, 400, 100, 40);
    [presentButton setTitle:@"Dismiss" forState:UIControlStateNormal];
    [presentButton addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:presentButton];

    // Do any additional setup after loading the view.
}

- (void)dismiss {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
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
