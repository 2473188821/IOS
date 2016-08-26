//
//  NSArray+arrayExpand.m
//  FunctionTest
//
//  Created by Chenfy on 16/8/26.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#import "NSArray+arrayExpand.h"

@implementation NSArray (arrayExpand)

/**
 *  安全读取数组数据
 *
 *  @param index 索引
 *
 *  @return 数据
 */
- (id)safeObjectAtIndex:(NSUInteger)index {
    if ( index >= self.count ) {
        return nil;
    }
    return [self objectAtIndex:index];
}

@end
