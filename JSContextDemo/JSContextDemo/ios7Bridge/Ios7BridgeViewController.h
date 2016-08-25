//
//  Ios7BridgeViewController.h
//  JSContextDemo
//
//  Created by Chenfy on 16/8/25.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Ios7BridgeViewController : UIViewController

/*
 * stringByEvaluatingJavaScriptFromString 方法的使用
 */

/** 调用本地函数 */
- (void)localCallShow;

/** 调用本地函数，并回调webview函数 */
- (void)localCallShowAndCallWebView;

@end
