//
//  Ios7BridgeViewController.m
//  JSContextDemo
//
//  Created by Chenfy on 16/8/25.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#import "Ios7BridgeViewController.h"

#define View_Title  @"uiwebView"

@interface Ios7BridgeViewController ()<UIWebViewDelegate>

@property(nonatomic,strong)UIWebView    *webView;

@end

@implementation Ios7BridgeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSURLCache sharedURLCache]removeAllCachedResponses];
    self.title = View_Title;
    
    [self.view addSubview:self.webView];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(navCalled:)];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)navCalled:(id)sender {
    [self.webView stringByEvaluatingJavaScriptFromString:@"jsAlert('This is a JS Alert!')"];
}

#pragma mark--webView
-(UIWebView *)webView {
    if (!_webView) {
        _webView = [[UIWebView alloc]initWithFrame:self.view.bounds];
        NSURL *url = [[NSBundle mainBundle] URLForResource:@"simple" withExtension:@"html"];
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
    
    NSString *urlString = [[request URL]absoluteString];
    if (![urlString containsString:@"chenfyjsbridge"]) {
        return YES;
    }
    NSArray *array = [urlString componentsSeparatedByString:@"?"];
    __unused NSString *key = array[0];
    NSString *method = array[1];
    NSString *param = array[2];
    
    NSArray *arrayParam = [param componentsSeparatedByString:@"="];
    NSString *valueParam = arrayParam[1];
    
    SEL selector = NSSelectorFromString(method);
    if ([self respondsToSelector:selector]) {
        [self performSelector:selector withObject:valueParam afterDelay:0];
    }
    return NO;
}

/** finish */
-(void)webViewDidFinishLoad:(UIWebView *)webView {

}

/** error */
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    
}

/** local method */
- (void)localCallShow {
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Title" message:@"This is a local Message!" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [alert show];
}

- (void)localCallShowAndCallWebView {
    [self.webView stringByEvaluatingJavaScriptFromString:@"jsSpan('This is Local Message !')"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
