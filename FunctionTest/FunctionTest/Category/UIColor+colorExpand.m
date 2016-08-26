//
//  UIColor+colorExpand.m
//  FunctionTest
//
//  Created by Chenfy on 16/8/26.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#import "UIColor+colorExpand.h"

@implementation UIColor (colorExpand)

/**
 *  根据字符串生成颜色
 *
 *  @param inColorString 16进制的颜色字符串，如ab2345
 *
 *  @return 颜色
 */
+ (UIColor *)colorFromHexRGB:(NSString *)inColorString {
    UIColor *result = nil;
    unsigned int colorCode = 0;
    unsigned char redByte, greenByte, blueByte;
    
    if (nil != inColorString) {
        NSScanner *scanner = [NSScanner scannerWithString:inColorString];
        (void) [scanner scanHexInt:&colorCode]; // ignore error
    }
    NSLog(@"Chenfy--colorCode--:%d",colorCode);
    redByte = (unsigned char) (colorCode >> 16);
    greenByte = (unsigned char) (colorCode >> 8);
    blueByte = (unsigned char) (colorCode); // masks off high bits
    result = [UIColor
              colorWithRed: (float)redByte / 0xff
              green: (float)greenByte/ 0xff
              blue: (float)blueByte / 0xff
              alpha:1.0];
    return result;
}

+ (UIColor *)colorFromHexRGB:(NSString *)inColorString alpha:(float)alpha {
    UIColor *result = [UIColor clearColor];
    unsigned int colorCode = 0;
    unsigned char redByte, greenByte, blueByte;
    
    if (nil != inColorString)
    {
        NSScanner *scanner = [NSScanner scannerWithString:inColorString];
        (void) [scanner scanHexInt:&colorCode]; // ignore error
        redByte = (unsigned char) (colorCode >> 16);
        greenByte = (unsigned char) (colorCode >> 8);
        blueByte = (unsigned char) (colorCode); // masks off high bits
        result = [UIColor
                  colorWithRed: (float)redByte / 0xff
                  green: (float)greenByte/ 0xff
                  blue: (float)blueByte / 0xff
                  alpha:alpha];
    }
    return result;
}

/**
 *  获取首页进度圆点颜色数组
 *
 *  @return 圆点颜色
 */
+ (NSArray *)getMainProgressColor {
    return @[@"008dbc", @"008ec0", @"008fc5", @"008fca", @"0091cf", @"0094d3", @"0098d6", @"009ed9", @"00a4d9", @"01a9d9", @"02afd9", @"01b7d9", @"03bed9", @"03c6d9", @"04ced9", @"04d7d8", @"05dfd7", @"06e7d6", @"06eed6", @"07f4d5", @"08f9d4", @"08fdd4", @"08ffd4", @"08ffd4", @"08ffd4", @"08ffd4", @"08ffd4", @"08ffd4", @"08ffd4", @"08ffd4", @"08ffd4", @"08ffd4", @"08ffd4", @"08ffd4", @"08ffd4", @"00e6be", @"00e6be"];
}


@end
