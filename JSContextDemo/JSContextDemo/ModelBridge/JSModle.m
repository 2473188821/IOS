//
//  JSModle.m
//  JSContextDemo
//
//  Created by Chenfy on 16/8/25.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#import "JSModle.h"

@implementation JSModle

/** 调用本地相册 */
- (void)localCallSystemCamera {
    NSLog(@"Called local system camera!");
    
    JSValue *jsValue = [self.jsContext evaluateScript:@"jsSpan"];
    [jsValue callWithArguments:@[@"Local Call Back!--localCallSystemCamera"]];
}

/** 调用本地多参数函数 */
- (void)localCallAlert:(NSString *)title message:(NSString *)msg {
    dispatch_async(dispatch_get_main_queue(), ^{
        UIAlertView *a = [[UIAlertView alloc] initWithTitle:title message:msg delegate:nil cancelButtonTitle:@"Ok-local" otherButtonTitles:nil, nil];
        [a show];
    });
}
/** 调用本地带参数函数 */
- (void)localCallWithDictionary:(NSDictionary *)dicParam {
    NSLog(@"localCallWithDictionary !-:%@",dicParam);
}
/** 调用本地带参数函数并且回调js */
- (void)localCallWithDictionaryAndCallBack:(NSDictionary *)dicParam {
    NSLog(@"localCallWithDictionaryAndCallBack !-:%@",dicParam);
    
    JSValue *jsValue = [self.jsContext evaluateScript:@"jsAlert"];
    [jsValue callWithArguments:@[@"Local Call Back!"]];
}



@end
