//
//  ViewController.m
//  JSContextDemo
//
//  Created by Chenfy on 16/8/25.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#import "ViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>

/*
 *屏幕尺寸参数
 */
#define SCREEN_WIDTH        [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT       [UIScreen mainScreen].bounds.size.height

#define View_Title  @" simple "

@interface ViewController ()<UIWebViewDelegate>

@property(nonatomic,strong)UIWebView    *webView;
@property(nonatomic,strong)JSContext    *jsContext;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSURLCache sharedURLCache]removeAllCachedResponses];
    self.title = View_Title;
    
    [self.view addSubview:self.webView];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(navCalled:)];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)navCalled:(id)sender {
    JSValue *jsValue = [self.jsContext evaluateScript:@"jsAlert"];
    [jsValue callWithArguments:@[View_Title]];
}

#pragma mark--webView
-(UIWebView *)webView {
    if (!_webView) {
        _webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        NSURL *url = [[NSBundle mainBundle] URLForResource:@"custom" withExtension:@"html"];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [_webView loadRequest:request];
        _webView.scalesPageToFit = YES;
        _webView.delegate = self;
        _webView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    }
    return _webView;
}

#pragma mark--webview的delegate
/** start */
-(void)webViewDidStartLoad:(UIWebView *)webView {
    
}

/** start loading */
-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    return YES;
}

/** finish */
-(void)webViewDidFinishLoad:(UIWebView *)webView {
    self.jsContext = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    self.jsContext.exceptionHandler = ^(JSContext *context ,JSValue *exceptionValue){
        context.exception = exceptionValue;
        NSLog(@"异常信息：%@", exceptionValue);
    };
    
    /** JS调用本地函数 */
    self.jsContext[@"jsCallSystemCamera"] = ^(){
        NSLog(@"Local jsCallSystemCamera");
    };
    self.jsContext[@"jsShowAlertMsg"] = ^(NSString *title ,NSString *message){
        NSLog(@"jsShowAlertMsg -title:%@  message:%@",title,message);
    };
    self.jsContext[@"jsCallWithDict"] = ^(id param){
        NSLog(@"jsCallWithDict-:%@",param);
    };
    
    __weak __typeof__(self) weakSelf = self;
    
    self.jsContext[@"jsCallObjcAndObjcCallJsWithDict"] = ^(id param){
        NSLog(@"jsCallObjcAndObjcCallJsWithDict-:%@",param);
        
        /** 本地调用JS函数 */
        JSValue *jsValue = [weakSelf.jsContext evaluateScript:@"jsSpan"];
        [jsValue callWithArguments:@[@"js Local Call"]];
    };
}

/** error */
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
