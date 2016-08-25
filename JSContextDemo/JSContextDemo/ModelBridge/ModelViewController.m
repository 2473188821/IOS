//
//  ModelViewController.m
//  JSContextDemo
//
//  Created by Chenfy on 16/8/25.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#import "ModelViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>
#import "JSModle.h"

/*
 *屏幕尺寸参数
 */
#define SCREEN_WIDTH        [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT       [UIScreen mainScreen].bounds.size.height

#define View_Title  @"Model"

@interface ModelViewController ()<UIWebViewDelegate>

@property(nonatomic,strong)UIWebView    *webView;
@property(nonatomic,strong)JSContext    *jsContext;

@end

@implementation ModelViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    self.title = View_Title;
    
    [self.view addSubview:self.webView];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(navCalled:)];
}

- (void)navCalled:(id)sender {
    JSValue *jsValue = [self.jsContext evaluateScript:@"jsAlert"];
    [jsValue callWithArguments:@[View_Title]];
}

#pragma mark--webView
-(UIWebView *)webView {
    if (!_webView) {
        _webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        NSURL *url = [[NSBundle mainBundle] URLForResource:@"model" withExtension:@"html"];
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
    NSURL *URL = [request URL];
    NSString *scheme = [URL scheme];
    __unused NSString *host = [URL host];
    
    if ([scheme isEqualToString:@"jsbridge"]) {
        NSURLComponents *componets = [[NSURLComponents alloc] initWithURL:URL resolvingAgainstBaseURL:NO];
       __unused  NSString *host = componets.host;
        NSArray *queryItems = componets.queryItems;
        
        __block NSURL *webURL = nil;
        [queryItems enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSURLQueryItem *queryItem = obj;
            if ([queryItem.name isEqualToString:@"url"] && queryItem.value) {
                webURL = [NSURL URLWithString:queryItem.value];
            }
        }];
        return NO;
    }
    return YES;
}

/** finish */
-(void)webViewDidFinishLoad:(UIWebView *)webView {
    self.jsContext = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    self.jsContext.exceptionHandler = ^(JSContext *context ,JSValue *jsvalue){
        context.exception = jsvalue;
        NSLog(@"Exception--Jsvalue :%@",jsvalue);
    };
    
    JSModle *model = [JSModle new];
    self.jsContext[@"OCModel"] = model;
    
    model.webView =webView;
    model.jsContext = self.jsContext;
}

/** error */
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    
    
}


@end
