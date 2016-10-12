//
//  ItemView.m
//  MasonaryTest
//
//  Created by Chenfy on 16/8/3.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#import "ItemView.h"
#import "Masonry.h"

@interface ItemView ()

@property(nonatomic,strong)UIView   *baseView;
@property(nonatomic,strong)UIImage  *image;
@property(nonatomic,copy)NSString   *text;


@end

@implementation ItemView

+ (instancetype)itemWithImage:(UIImage *)image text:(NSString *)text {
    ItemView *item = [ItemView new];
    item.backgroundColor = [UIColor orangeColor];
    item.image = image;
    item.text = text;
    [item initView];
    return item;
}

- (void)initView {
    UIImageView *imageV = [[UIImageView alloc]initWithImage:_image];
    [self addSubview:imageV];
    self.baseView = imageV;
    
    [imageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).offset(5);
        make.left.mas_equalTo(self.mas_left).offset(5);
        make.right.mas_equalTo(self.mas_right).offset(-5);
    }];
    
    [imageV setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    [imageV setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    
    UILabel *label = [UILabel new];
    label.numberOfLines = 0;
    label.lineBreakMode = NSLineBreakByWordWrapping;
    label.text = _text;
    label.textColor = [UIColor whiteColor];
    [self addSubview:label];
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(imageV.mas_bottom).offset(5);
        make.left.mas_equalTo(imageV.mas_left);
        make.bottom.mas_equalTo(self.mas_bottom).offset(-4);
        make.right.mas_equalTo(imageV.mas_right).offset(-4);
    }];
    
    [label setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
}

-(UIView *)viewForBaselineLayout {
    return _baseView;
}


@end
