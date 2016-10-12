//
//  CalcuteManager.m
//  XXTest
//
//  Created by Chenfy on 16/7/8.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#import "CalcuteManager.h"

@implementation CalcuteManager

+ (long long)getMax:(NSArray *)array {
    if ([array count] == 0) {
        return NSNotFound;
    }
    long long numMax = 0;

    for (int i = 0; i < [array count]; i ++ ) {
        id value = array[i];
        if (![value isKindOfClass:[NSNumber class]]) {
            return  NSNotFound;
        }
        numMax = MAX(numMax, [array[i] longLongValue]);
    }
    return numMax;
}


//+ (int)getMax:(NSArray<NSInteger> *)array {
//    int i = 0;
//    return 0;
//}


@end
