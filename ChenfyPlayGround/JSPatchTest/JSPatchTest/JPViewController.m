//
//  ViewController.m
//  JSPatchTest
//
//  Created by Chenfy on 16/8/7.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#import "JPViewController.h"
#import "ObjectModel.h"

@interface JPViewController ()

@property(nonatomic,strong)UIView   *genView;

@end

@implementation JPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:[self genView]];

    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 50)];
    [btn setTitle:@"Push JPTableViewController" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(handleBtn:) forControlEvents:UIControlEventTouchUpInside];
    [btn setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:btn];
    

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)handleBtn:(id)sender
{
    
}

- (UIView *)genView {
    if (!_genView) {
        _genView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 320)];
        _genView.backgroundColor = [UIColor purpleColor];
    }
    return _genView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
