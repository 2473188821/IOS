//
//  MyCell.m
//  UICollectionViewTest
//
//  Created by Chenfy on 16/9/22.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#import "MyCell.h"

@implementation MyCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.label = [[UILabel alloc]initWithFrame:frame];
        self.label.textAlignment = NSTextAlignmentCenter;
        self.label.frame = CGRectMake(0, 0, frame.size.width, frame.size.width);
        self.label.backgroundColor = [UIColor yellowColor];
        [self addSubview:self.label];
    }
    return self;
}



@end
