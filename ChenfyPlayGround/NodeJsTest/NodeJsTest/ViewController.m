//
//  ViewController.m
//  NodeJsTest
//
//  Created by Chenfy on 16/8/26.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 50)];
    [btn setTitle:@"Get Node JS Data !" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(handleBtn:) forControlEvents:UIControlEventTouchUpInside];
    [btn setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:btn];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)handleBtn:(id)sender {
    NSURL *url = [NSURL URLWithString:@"http://127.0.0.1:8080/hello.js"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSData *data =[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    __unused  NSString *string = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
