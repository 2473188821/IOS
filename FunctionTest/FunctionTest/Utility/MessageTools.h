//
//  MessageTools.h
//  FunctionTest
//
//  Created by Chenfy on 16/9/8.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MessageTools : NSObject

//消息弹框
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
/**
 *  消息提示框  － 两个按钮（确定 | 取消）
 *
 *  @param message 消息
 */
+(void)showMessage:(NSString *)message;

/**
 *  消息提示框  － 单个按钮 （确定）
 *
 *  @param message 消息
 */
+(void)showMessageWithSure:(NSString *)message;


//消息等待视图
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
/**
 *  打开视图等待框
 *
 *  @param message 展示消息
 */
+(void)showViewHUD:(NSString *)message;

/**
 *  关闭视图等待框
 */
+(void)hideViewHUD;

@end
