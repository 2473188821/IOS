//
//  UIColor+colorExpand.h
//  FunctionTest
//
//  Created by Chenfy on 16/8/26.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (colorExpand)

/**
 *  根据字符串生成颜色
 *
 *  @param inColorString 16进制的颜色字符串，如ab2345
 *
 *  @return 颜色
 */
+ (UIColor *)colorFromHexRGB:(NSString *)inColorString;

/**
 *  根据字符串生成颜色
 *
 *  @param inColorString 16进制的颜色字符串，如ab2345
 *  @param alpha         透明度0.0-1.0
 *
 *  @return 颜色
 */
+(UIColor *)colorFromHexRGB:(NSString *)inColorString alpha:(float)alpha;

/**
 *  获取首页进度圆点颜色数组
 *
 *  @return 圆点颜色
 */
+ (NSArray *)getMainProgressColor;

@end
