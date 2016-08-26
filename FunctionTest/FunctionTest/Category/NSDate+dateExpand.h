//
//  NSDate+dateExpand.h
//  FunctionTest
//
//  Created by Chenfy on 16/8/26.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (dateExpand)

//NSDate日期转换为NSString
/**
 *  日期转换为字符串
 *
 *  @param date 需要转换的日期
 *
 *  @return 日期字符串
 */
+ (NSString *)dateToString:(NSDate *)date;

//字符串转日期 string to date
/**
 *  日期字符串转日起
 *
 *  @param dateString 日期字符串
 *
 *  @return 日期
 */
+ (NSDate *)stringToDate:(NSString *)dateString;

@end
