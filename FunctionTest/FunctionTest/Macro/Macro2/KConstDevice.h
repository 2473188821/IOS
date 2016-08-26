//
//  KConstDevice.h
//  FunctionTest
//
//  Created by Chenfy on 16/8/26.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#ifndef KConstDevice_h
#define KConstDevice_h

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


#endif /* KConstDevice_h */
