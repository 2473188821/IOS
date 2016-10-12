//
//  ViewController.m
//  XXTest
//
//  Created by Chenfy on 16/5/31.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#import "ViewController.h"
#import "CalcuteManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *arr = @[@123 ,@456 ,@12 ,@10723412341890 , @"32"];
    long long macNum = [CalcuteManager getMax:arr];
    NSLog(@"macNum:%lld",(long long)macNum);
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
