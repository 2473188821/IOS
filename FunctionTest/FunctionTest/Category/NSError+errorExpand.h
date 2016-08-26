//
//  NSError+errorExpand.h
//  FunctionTest
//
//  Created by Chenfy on 16/8/26.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSError (errorExpand)

/**
 *  获取错误信息内的错误描述
 *
 *  @return 错误信息String
 */
- (NSString *)errorDescription ;

@end
