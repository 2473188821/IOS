//
//  NSDictionary+dictionaryExpand.h
//  FunctionTest
//
//  Created by Chenfy on 16/8/26.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (dictionaryExpand)

//NSDictionary  to json
/**
 *  NSDictionary类型数据转换为json字符串
 *
 *  @param dicParam NSDictionary数据
 *
 *  @return 转换后的json字符串
 */
+ (NSString *)dicToJson:(NSDictionary *)dicParam;

//Json to NSDictionary
/**
 *  json字符串转换为NSDictionary类型数据
 *
 *  @param jsonString jsonString json字符串
 *
 *  @return NSDictionary类型数据
 */
+ (NSDictionary *)jsonToDic:(NSString *)jsonString;


@end
