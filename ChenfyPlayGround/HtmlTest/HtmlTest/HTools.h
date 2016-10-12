//
//  HTools.h
//  HtmlTest
//
//  Created by Chenfy on 16/9/5.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface HTools : NSObject

+ (UILabel *)createLabelFrame:(CGRect)frame backGroundColor:(UIColor *)bgColor textColor:
    (UIColor *)textColor;

+ (UIButton *)createButtonFrame:(CGRect)frame title:(NSString *)title target:(id)target action:(SEL)selector;

@end
