//
//  Case6VC.m
//  MasonaryTest
//
//  Created by Chenfy on 16/8/1.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#import "Case6VC.h"
#import "Masonry/Masonry/Masonry.h"
#import "ItemView.h"

@implementation Case6VC

-(void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    UIImage *image_dog_small = [UIImage imageNamed:@"dog_small"];
    UIImage *image_dog_middle = [UIImage imageNamed:@"dog_middle"];
    UIImage *image_dog_big = [UIImage imageNamed:@"dog_big"];
    
    ItemView *i1 = [ItemView itemWithImage:image_dog_small text:@"Auto layout is 从今天开始学习Swift - Swift是适用于iOS和OS X应用的全新编程语言"];
    ItemView *i2 = [ItemView itemWithImage:image_dog_middle text:@"Auto Layout is a system that lets you lay out"];
    ItemView *i3 = [ItemView itemWithImage:image_dog_big text:@"Auto Layout is a system that lets you lay out your app’s user CocoaChina前身是全球成立最早规模最大的苹果开发中文站,现致力为所有移动开发者提供资讯服务、问答服务、代码下载、工具库及人才招聘服务"];
    
    [self.view addSubview:i1];
    [self.view addSubview:i2];
    [self.view addSubview:i3];
    
    [i1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).offset(20);
        make.top.mas_equalTo(self.view.mas_top).offset(300);
    }];

    [i2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(i1.mas_right).offset(10);
        make.baseline.mas_equalTo(i1.mas_baseline);
    }];
    
    [i3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(i2.mas_right).offset(10);
        make.baseline.mas_equalTo(i1.mas_baseline);
    }];
}


@end
