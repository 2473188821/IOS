//
//  NSDate+dateExpand.m
//  FunctionTest
//
//  Created by Chenfy on 16/8/26.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#import "NSDate+dateExpand.h"

@implementation NSDate (dateExpand)

//NSDate日期转换为NSString
+ (NSString *)dateToString:(NSDate *)date {
    NSDateFormatter *formater = [[NSDateFormatter alloc]init];
    [formater setDateFormat:@"yyyy-MM-dd"];
    NSString *str = [formater stringFromDate:date];
    return  str;
}

//字符串转日期 string to date
+ (NSDate *)stringToDate:(NSString *)dateString {
    return nil;
}


@end
