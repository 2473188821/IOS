//
//  Case3VC.m
//  MasonaryTest
//
//  Created by Chenfy on 16/8/1.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#import "Case3VC.h"
#import "Masonry/Masonry/Masonry.h"

@interface Case3VC ()

@property(nonatomic,strong)UIView *contannerView;

@property(nonatomic,assign)int W_MAX;

@end

@implementation Case3VC

#define V_H 50

-(void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    _W_MAX = 280;
    
    _contannerView = [UIView new];
    _contannerView.frame = CGRectMake(0, 0, 280, 50);
    _contannerView.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:_contannerView];
    [_contannerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.top.mas_equalTo(100);
        make.height.mas_equalTo(V_H);
        make.width.mas_equalTo(_W_MAX);
    }];
    
    UIView *subView = [UIView new];
    subView.backgroundColor = [UIColor yellowColor];
    [_contannerView addSubview:subView];
    
    [subView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(_contannerView);
        make.width.mas_equalTo(_contannerView.mas_width).multipliedBy(0.5);
    }];
    
    UIButton *btnAdd = [UIButton buttonWithType:UIButtonTypeCustom];
    btnAdd.tag = 100;
    [btnAdd setTitle:@"btn" forState:UIControlStateNormal];
    [btnAdd setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btnAdd.frame = CGRectMake(100, 200, 50, 30);
    btnAdd.backgroundColor = [UIColor purpleColor];
    [btnAdd addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnAdd];
}

- (void)btnClicked:(UIButton *)sender {
    _W_MAX -= 20;
    if (_W_MAX < 0) {
        _W_MAX = 260;
    }
    [_contannerView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(_W_MAX);
    }];
}





@end


