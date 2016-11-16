//
//  WaitViewController.m
//  DemoFunctionTest
//
//  Created by Chenfy on 16/11/16.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#import "WaitViewController.h"
#import "CCProgressView.h"

@interface WaitViewController ()

@end

@implementation WaitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [CCProgressView showProgressForView:self.view animated:YES];
    
    
    [self performSelector:@selector(viewHidden) withObject:nil afterDelay:2];
    // Do any additional setup after loading the view.
}

- (void)viewHidden {
    [CCProgressView hideProgressForView:self.view animated:YES];
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
