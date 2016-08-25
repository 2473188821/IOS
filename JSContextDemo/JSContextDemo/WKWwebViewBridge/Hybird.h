//
//  Hybird.h
//  NoWait
//
//  Created by liu nian on 5/13/16.
//  Copyright © 2016 Shanghai Puscene Information Technology Co.,Ltd. All rights reserved.
//

#import <WebKit/WebKit.h>


@class WkWebViewController;
@interface Hybird : NSObject

- (instancetype)initWithWebView:(WKWebView *)webView webController:(WkWebViewController *)webController;

#pragma mark - app业务

- (void)excuteScriptMessage:(WKScriptMessage *)message;
#pragma mark - DO
/**
 *  上传配置信息
 *
 */
- (void)doUploadAppInfoAtWebViewDidLoadFinish;
@end