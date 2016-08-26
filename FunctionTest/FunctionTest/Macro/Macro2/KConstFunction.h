//
//  KConstFunction.h
//  FunctionTest
//
//  Created by Chenfy on 16/8/26.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#ifndef KConstFunction_h
#define KConstFunction_h

/** 系统单例 */
#define USER_DEFAULT [NSUserDefaults standardUserDefaults]
#define Notification [NSNotificationCenter defaultCenter]

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
/** 资源获取 */
#define GetImageWithPath(name) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:name ofType:@"png"]]
#define GetImageJPGWithPath(name) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:name ofType:@"jpg"]]

//*************************************************************************
/** 去除警告 */
#define SUPPRESS_PERFORM_SELECTOR_LEAK_WARNING(code)                    \
_Pragma("clang diagnostic push")                                        \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"")     \
code;                                                                   \
_Pragma("clang diagnostic pop")



#endif /* KConstFunction_h */
