//
//  NSString+stringExpand.m
//  FunctionTest
//
//  Created by Chenfy on 16/8/26.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#import "NSString+stringExpand.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (stringExpand)

/**
 *  字符串判空
 *
 *  @return YES/NO
 */
- (BOOL)isNotEmpty {
    return (self != nil && [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length > 0);
}

/**
 *  汉字转拼音
 *
 *  @return 拼音
 */
- (NSString *)transformToPinyin {
    NSMutableString *mutableString = [NSMutableString stringWithString:self];
    CFStringTransform((CFMutableStringRef)mutableString, NULL, kCFStringTransformToLatin, false);
    mutableString = (NSMutableString *)[mutableString stringByFoldingWithOptions:NSDiacriticInsensitiveSearch locale:[NSLocale currentLocale]];
    return mutableString;
}

/**
 *  获取MD5字符串
 *
 *  @return MD5字符串
 */
- (NSString *)md5Value {
    const char *cStr = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, (CC_LONG)strlen(cStr), result);
    NSString *md5Value = [NSString stringWithFormat:
                          @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
                          result[0], result[1], result[2], result[3], result[4], result[5], result[6], result[7],
                          result[8], result[9], result[10], result[11], result[12], result[13], result[14], result[15]
                          ];
    return md5Value;
}


@end
