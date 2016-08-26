//
//  KPublicConst.h
//  FunctionTest
//
//  Created by Chenfy on 16/8/24.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

/*******************************************************************************
 * 版权所有 (C)2015
 *
 * 文件名称：
 * 内容摘要： 常量定义(可应用于其他项目)。
 * 当前版本： v1.0
 * 作   者：
 * 完成日期：
 * 说   明：
 
 * 修改日期：
 * 版 本 号：
 * 修 改 人：
 * 修改内容：
 ******************************************************************************/

#ifndef KPublicConst_h
#define KPublicConst_h

//*************************************************************************
/*
 * 地址设置模版 
 */
//医网签业务地址：
#define SERVER  2

#if(SERVER == 1)  //!< 开发联调环境
//业务
const static NSString * SERVER_ADDRESS = @"http://60.247.77.124:8080";

#elif(SERVER == 2)  //!<测试环境
//业务
const static NSString * SERVER_ADDRESS = @"http://192.168.135.243:8080";

#elif(SERVER == 3)  //!<集成环境
//业务
const static NSString * SERVER_ADDRESS = @"http://123.56.26.178:8080";

#endif

//*************************************************************************
/*
 *  全局数据设置
 */
/** 屏幕尺寸参数 */
#define SCREEN_WIDTH        [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT       [UIScreen mainScreen].bounds.size.height

/** 除去导航的尺寸 */
#define MAINVIEW_HEIGHT (SCREEN_HEIGHT - 64)

#define NAVIGATIONBAR_HEIGHT 44.0f
#define STATUSBAR_HEIGHT 20.0f
#define NAVBAR_STATUE_HEIGHT 64.0f
#define SCREEN_SCALE SCREEN_WIDTH/320.0f

/** 全局颜色设置 */
#define NAV_BG_COLOR @"e51c23"  //!<导航栏背景颜色
#define BTN_BG_COLOR @"f5f0f5"  //!<首页分类背景颜色
#define LINE_BG_COLOR @"e8e6e8"  //!<首页分类背景颜色
#define TEXTFEID_NORMAL_COLOR @"BDC7D8"  //!<首页分类背景颜色
#define TEXTFEID_CLICK_COLOR @"ffC7D8"  //!<首页分类背景颜色

/** 系统单例 */
#define USER_DEFAULT [NSUserDefaults standardUserDefaults]
#define Notification [NSNotificationCenter defaultCenter]

//*************************************************************************
/** 线程 */
#define GCD_GLOBAL_QUEUE dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
#define MAIN_QUEUE dispatch_get_main_queue()

#define dispatch_main_sync_safe(block)\
if ([NSThread isMainThread])\
{\
block();\
}\
else\
{\
dispatch_sync(dispatch_get_main_queue(), block);\
}

/** 防止死循环的弱引用 */
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self


//*************************************************************************
/** 单例文件声明 */
//单例宏文件头
#pragma mark--单例宏文件
#define DEFINE_SINGLETON_FOR_HEADER(className) \
\
+ (className *)shared##className;

//单例宏文件实现
#define DEFINE_SINGLETON_FOR_CLASS(className) \
\
+ (className *)shared##className { \
static className *shared##className = nil; \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
shared##className = [[self alloc] init]; \
}); \
return shared##className; \
}

//*************************************************************************
/** iOS去掉日志 */
#ifndef __OPTIMIZE__
#define NSLog(...) NSLog(__VA_ARGS__)
#else
#define NSLog(...){}
#endif

// bug调试
#if DEBUG
#define HKLog(...) NSLog(__VA_ARGS__)
#else
#define HKLog(...)
#endif

//打开Xcode -->>product -->scheme -->>edit scheme -->info 设置debug or release

//*************************************************************************
/** Device相关 */
#define SystemVersion         [[[UIDevice currentDevice] systemVersion] floatValue]

/** 设备类型判断 */
#ifndef IS_IPHONE
#define IS_IPHONE ([[[UIDevice currentDevice] model] isEqualToString:@"iPhone"])
#endif

#ifndef IS_IPOD
#define IS_IPOD   ([[[UIDevice currentDevice ] model] isEqualToString:@"iPod touch"])
#endif

#pragma mark - IPAD判断
#define IS_IPAD ([[[UIDevice currentDevice ] model] isEqualToString:@"iPad"] || [[[UIDevice currentDevice] model] isEqualToString:@"iPad Simulator"])

/** 系统判断 */
#pragma mark - IOS8及以上系统
#define IOS8 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0000 ? YES : NO)

#pragma mark - IOS7判断
#define IOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0000 ? YES : NO)

#define iPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)

//*************************************************************************
/** 资源获取 */
#define GetImageWithPath(name) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:name ofType:@"png"]]
#define GetImageJPGWithPath(name) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:name ofType:@"jpg"]]

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


#define SPLIT_LINE_COLOR @"dbdbdb"  //!<分割线颜色
#define WINDOW_COLOR [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4]  //!<蒙层颜色
#define WHITECOLOR [UIColor whiteColor]
#define CLEARCOLOR [UIColor clearColor]
#define BLACKCOLOR [UIColor blackColor]
#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

/** 字体设置 */
#define FONT_BOLD(num)      [UIFont boldSystemFontOfSize: num]
#define FONT_SYSTEM(num)    [UIFont systemFontOfSize: num]

#define SUPPRESS_PERFORM_SELECTOR_LEAK_WARNING(code)                    \
_Pragma("clang diagnostic push")                                        \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"")     \
code;                                                                   \
_Pragma("clang diagnostic pop")


#endif /* KPublicConst_h */
