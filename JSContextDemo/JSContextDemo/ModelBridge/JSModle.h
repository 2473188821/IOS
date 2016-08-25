//
//  JSModle.h
//  JSContextDemo
//
//  Created by Chenfy on 16/8/25.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>
#import <WebKit/WebKit.h>

@protocol JSModelProtocol <JSExport>

@required
/** 调用本地相册 */
- (void)localCallSystemCamera;
/** 调用本地多参数函数 */
- (void)localCallAlert:(NSString *)title message:(NSString *)msg;
/** 调用本地带参数函数 */
- (void)localCallWithDictionary:(NSDictionary *)dicParam;
/** 调用本地带参数函数并且回调js */
- (void)localCallWithDictionaryAndCallBack:(NSDictionary *)dicParam;

@end

@interface JSModle : NSObject <JSModelProtocol>

@property(nonatomic,strong)UIWebView    *webView;
@property(nonatomic,strong)JSContext    *jsContext;

@end
