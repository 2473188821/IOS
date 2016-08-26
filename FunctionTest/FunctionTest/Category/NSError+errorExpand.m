//
//  NSError+errorExpand.m
//  FunctionTest
//
//  Created by Chenfy on 16/8/26.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#import "NSError+errorExpand.h"

@implementation NSError (errorExpand)

/** 获取错误信息内的错误描述 */
- (NSString *)errorDescription {
    NSDictionary *dic = [self userInfo];
    NSString *address = dic[@"NSErrorFailingURLKey"];
    NSString *message = dic[@"NSLocalizedDescription"];
    NSString *errMsg = [NSString stringWithFormat:@"<%@>-<%@>",address,message];
    return errMsg;
}

@end
