//
//  Case9VC.m
//  MasonaryTest
//
//  Created by Chenfy on 16/8/1.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#import "Case9VC.h"
#import "Masonry/Masonry/Masonry.h"

#define Height_Inner    50

#define ITEM_SIZE      32
#define ITEM_COUNT      3

@interface Case9VC ()

@property(nonatomic,strong)UIView   *viewContainnerF;
@property(nonatomic,strong)UIView   *viewContainnerS;

@property(nonatomic,strong)UISlider *slider;
@property(nonatomic,assign)float    MAX_width_containner;

@property(nonatomic,strong)MASConstraint    *masF;
@property(nonatomic,strong)MASConstraint    *masS;

@property(nonatomic,strong)NSMutableArray   *arrayObjects;

@end

@implementation Case9VC

-(void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    _MAX_width_containner = 260;
    _viewContainnerF = [UIView new];
    _viewContainnerF.backgroundColor = [UIColor orangeColor];
    
    _viewContainnerS = [UIView new];
    _viewContainnerS.backgroundColor = [UIColor yellowColor];
    
    _slider = [[UISlider alloc]init];
    _slider.maximumValue = _MAX_width_containner;
    _slider.minimumValue = 0;
    _slider.value = _MAX_width_containner;
    
    [_slider addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:_viewContainnerF];
    [self.view addSubview:_viewContainnerS];
    [self.view addSubview:_slider];
    
    [_viewContainnerF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.top.mas_equalTo(self.view.mas_top).offset(80);
        make.height.mas_equalTo(Height_Inner);
        _masF = make.width.mas_equalTo(_MAX_width_containner);
    
    }];
    
    [_viewContainnerS mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.height.mas_equalTo(Height_Inner);
        make.top.mas_equalTo(_viewContainnerF.mas_bottom).offset(30);
        _masS = make.width.mas_equalTo(_MAX_width_containner);
    }];
    
    [_slider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).offset(20);
        make.right.mas_equalTo(self.view).offset(-20);

        make.top.mas_equalTo(_viewContainnerS.mas_bottom).offset(30);
    }];
    
    [self initF];
}

- (void)initF {
    UIView *vF = [UIView new];
    vF.backgroundColor = [UIColor blueColor];
    [_viewContainnerF addSubview:vF];
    
    [vF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.mas_equalTo(_viewContainnerF);
    }];
    
    for (int i = 0; i < ITEM_COUNT; i++) {
        UILabel *labelContent = [UILabel new];
        labelContent.backgroundColor = [UIColor redColor];
        [_viewContainnerF addSubview:labelContent];
        
        [labelContent mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.mas_equalTo(_viewContainnerF);
            make.height.width.mas_equalTo(ITEM_SIZE);
            make.left.mas_equalTo(vF.mas_right);
        }];
        
        UILabel *space = [UILabel new];
        space.backgroundColor = [UIColor blueColor];
        [_viewContainnerF addSubview:space];
        
        [space mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.mas_equalTo(_viewContainnerF);
            make.width.mas_equalTo(vF.mas_width);
            make.left.mas_equalTo(labelContent.mas_right).priorityHigh();
        }];
        
        vF = space;
    }
    
    [vF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(_viewContainnerF.mas_right);
    }];
}

- (void)valueChanged:(UISlider *)sender {
    NSLog(@"slider--:%f",sender.value);
    _masF.mas_equalTo(sender.value);
    _masS.mas_equalTo(sender.value);
}


@end
