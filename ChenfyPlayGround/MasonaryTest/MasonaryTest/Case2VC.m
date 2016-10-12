//
//  Case2VC.m
//  MasonaryTest
//
//  Created by Chenfy on 16/8/1.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#import "Case2VC.h"
#import "Masonry/Masonry/Masonry.h"

@interface Case2VC ()

@property(nonatomic,strong)UIView *containnerView;
@property(nonatomic,strong)NSMutableArray *arrayLabels;
@property(nonatomic,strong)NSMutableArray *arrayMas;

@end

@implementation Case2VC

-(void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    self.arrayMas = [NSMutableArray array];
    self.arrayLabels = [NSMutableArray array];
    
    [self initContainView];
    [self initSubviewS];
}

#define Label_H 30

- (void)initContainView {
    _containnerView = [UIView new];
    [self.view addSubview:_containnerView];
    _containnerView.backgroundColor = [UIColor greenColor];
    
    [_containnerView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.width.equalTo(self.view.mas_width).offset(-40);
        make.height.mas_equalTo(Label_H);
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.top.mas_equalTo(100);
    }];
    
    
    UIButton *btnAdd = [UIButton buttonWithType:UIButtonTypeCustom];
    btnAdd.tag = 100;
    btnAdd.frame = CGRectMake(100, 200, 50, 30);
    btnAdd.backgroundColor = [UIColor purpleColor];
    [btnAdd addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnAdd];
    
    UIButton *btnMinus = [UIButton buttonWithType:UIButtonTypeCustom];
    btnMinus.tag = 101;
    btnMinus.frame = CGRectMake(230, 200, 50, 30);
    btnMinus.backgroundColor = [UIColor purpleColor];
    [btnMinus addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnMinus];

}

- (void)btnClicked:(UIButton *)sender {
    NSInteger num = [_arrayMas count];
    static int i = 0;
    if (i < num -1) {
        i++;
    } else {
        i--;
    }
    NSLog(@"i--:%d",i);
    
    if (sender.tag == 100) {
        MASConstraint *con = _arrayMas[i];
        con.mas_equalTo(Label_H);
    }
    if (sender.tag == 101) {
        MASConstraint *con = _arrayMas[i];
        con.mas_equalTo(0);
    }
}


- (void)initSubviewS {
    __block UIView *lastView = nil;
    __block MASConstraint *conta_W = nil;
    
    for (int i = 0 ; i < 7; i ++) {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 50, 30)];
        label.text = [NSString stringWithFormat:@"L-%d",i];
        label.backgroundColor = [UIColor orangeColor];
        [_containnerView addSubview:label];
        [_arrayLabels addObject:label];
    }
    
    int num = _arrayLabels.count;

    [_arrayLabels enumerateObjectsUsingBlock:^(UIView *view, NSUInteger idx, BOOL * _Nonnull stop) {
       
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
        
            conta_W = make.width.equalTo(@(Label_H));
            make.height.mas_equalTo(Label_H);
            make.centerY.mas_equalTo(view.superview.mas_centerY);

            make.left.mas_equalTo(lastView ? lastView.mas_right:view.superview.mas_left);
            if (idx == num - 1) {
                NSLog(@"------%d->",idx);
                make.right.equalTo(view.superview.mas_right);
            }
             
            [_arrayMas addObject:conta_W];
            lastView = view;

        }];
    }];
    
    
    
    
}

@end
