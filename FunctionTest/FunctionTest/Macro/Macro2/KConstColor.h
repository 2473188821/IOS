//
//  KConstColor.h
//  FunctionTest
//
//  Created by Chenfy on 16/8/26.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#ifndef KConstColor_h
#define KConstColor_h

/** 字体设置 */
#define FONT_BOLD(num)      [UIFont boldSystemFontOfSize:num]
#define FONT_SYSTEM(num)    [UIFont systemFontOfSize:num]
#define FONT_CELL           [UIFont systemFontOfSize:15]


/** 全局颜色设置 */
#define NAV_BG_COLOR @"e51c23"  //!<导航栏背景颜色
#define BTN_BG_COLOR @"f5f0f5"  //!<首页分类背景颜色
#define LINE_BG_COLOR @"e8e6e8"  //!<首页分类背景颜色
#define TEXTFEID_NORMAL_COLOR @"BDC7D8"  //!<首页分类背景颜色
#define TEXTFEID_CLICK_COLOR @"ffC7D8"  //!<首页分类背景颜色
#define SPLIT_LINE_COLOR @"dbdbdb"  //!<分割线颜色

#define WINDOW_COLOR [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4]  //!<蒙层颜色

#define WHITECOLOR [UIColor whiteColor]
#define CLEARCOLOR [UIColor clearColor]
#define BLACKCOLOR [UIColor blackColor]
#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

// 16进制颜色
#define SXRGB16Color(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
//RGB 颜色
#define SXRGBAColor(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

/** 颜色设置 */
#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

//RGB color macro with alpha
#define UIColorFromRGBWithAlpha(rgbValue,a) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:a]




#endif /* KConstColor_h */
