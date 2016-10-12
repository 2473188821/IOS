//
//  Case5VC.m
//  MasonaryTest
//
//  Created by Chenfy on 16/8/1.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#import "Case5VC.h"
#import "Masonry/Masonry/Masonry.h"


@interface Case5VC ()

@property(nonatomic,strong)UIView   *viewTop;
@property(nonatomic,strong)UIView   *viewBottom;

@end

@implementation Case5VC

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"top(bottom)LayoutGuide";
    [self initView];
    NSLog(@"[viewDidLoad] top: %g", self.topLayoutGuide.length);
    
    self.navigationController.navigationBarHidden = NO;
    self.navigationController.toolbarHidden = NO;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:btn];
    btn.backgroundColor = [UIColor blackColor];
    [btn setTitle:@"导航栏变化" forState:UIControlStateNormal];
    
    [btn addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
    
    
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(50);
        make.width.mas_equalTo(220);
        make.center.mas_equalTo(self.view);
    }];
}

- (void)buttonClicked {
    [self.navigationController setNavigationBarHidden:!self.navigationController.navigationBarHidden animated:NO];
    [self.navigationController setToolbarHidden:!self.navigationController.toolbarHidden animated:NO];
    [self updateViewConstraints];
}



- (void)initView {
    _viewTop = [UIView new];
    _viewTop.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:_viewTop];
    
    [_viewTop mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.view);
        make.height.mas_equalTo(50);
        make.top.mas_equalTo(self.mas_topLayoutGuide);
    }];
    
    _viewBottom = [UIView new];
    _viewBottom.backgroundColor = [UIColor greenColor];
    [self.view addSubview:_viewBottom];
    
    [_viewBottom mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.view);
        make.height.mas_equalTo(50);
        make.bottom.mas_equalTo(self.mas_bottomLayoutGuide);
    }];
}

-(void)updateViewConstraints {
    [super updateViewConstraints];
}


@end
