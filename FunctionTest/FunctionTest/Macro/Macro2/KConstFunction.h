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

#if DEBUG
#define DebugLog(...) NSLog(__VA_ARGS__)
#elif DEBUG == 1
#define DebugLog(...)
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

#define LoadImage(name)   [UIImage imageNamed:name]

//*************************************************************************
/** 去除警告 */
#define SUPPRESS_PERFORM_SELECTOR_LEAK_WARNING(code)                    \
_Pragma("clang diagnostic push")                                        \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"")     \
code;                                                                   \
_Pragma("clang diagnostic pop")


//这个-Wunused-variable代表的意思就是 有的东西 你实例化了但是没有使用
/** 去除警告 */
#define SUPPRESS_UNUSED_WARNING(code)                                   \
_Pragma("clang diagnostic push")                                        \
_Pragma("clang diagnostic ignored \"-Wunused-variable\"")               \
code;                                                                   \
_Pragma("clang diagnostic pop")                                         \

/** GCD线程代码块 */
#define dispatch_main_sync_safe(block)\
if ([NSThread isMainThread]) {\
block();\
} else {\
dispatch_sync(dispatch_get_main_queue(), block);\
}

#define dispatch_main_async_safe(block)\
if ([NSThread isMainThread]) {\
block();\
} else {\
dispatch_async(dispatch_get_main_queue(), block);\
}

/** 枚举的重定义 */
#ifndef NS_ENUM
#define NS_ENUM(_type, _name) enum _name : _type _name; enum _name : _type
#endif

#ifndef NS_OPTIONS
#define NS_OPTIONS(_type, _name) enum _name : _type _name; enum _name : _type
#endif

/** arc 与 非arc的判断 */
#if !__has_feature(objc_arc)
#error SDWebImage is ARC only. Either turn on ARC for the project or use -fobjc-arc flag
#endif

#endif /* KConstFunction_h */
