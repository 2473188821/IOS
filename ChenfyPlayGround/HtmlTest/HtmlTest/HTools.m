//
//  HTools.m
//  HtmlTest
//
//  Created by Chenfy on 16/9/5.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#import "HTools.h"

@implementation HTools

+ (UILabel *)createLabelFrame:(CGRect)frame backGroundColor:(UIColor *)bgColor textColor:(UIColor *)textColor {
    UILabel *label = [[UILabel alloc]initWithFrame:frame];
    label.backgroundColor = bgColor;
    label.textColor = textColor;
    return label;
}

+ (UIButton *)createButtonFrame:(CGRect)frame title:(NSString *)title target:(id)target action:(SEL)selector {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    button.backgroundColor = [UIColor greenColor];
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    return button;
}


@end
