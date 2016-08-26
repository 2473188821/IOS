//
//  NSString+stringExpand.h
//  FunctionTest
//
//  Created by Chenfy on 16/8/26.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (stringExpand)

/**
 *  字符串判空
 *
 *  @return YES/NO
 */
- (BOOL)isNotEmpty;

/**
 *  获取MD5字符串
 *
 *  @return MD5字符串
 */
- (NSString *)md5Value;

/**
 *  汉字转拼音
 *
 *  @return 拼音
 */
- (NSString *)transformToPinyin;


@end
