//
//  ViewController.m
//  Test
//
//  Created by Chenfy on 16/9/15.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#import "ViewController.h"

/** 屏幕尺寸参数 */
#define SCREEN_WIDTH        [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT       [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<UIWebViewDelegate,UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UIWebView    *webView;
@property(nonatomic,strong)UILabel      *labelFont;


@property(nonatomic,strong)UITableView  *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.view addSubview:self.tableView];
    return;
//    [[UIApplication sharedApplication]setStatusBarHidden:YES];
    NSString *urlString = @"https://www.baidu.com";
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    [self.view addSubview:self.webView];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self.tableView reloadData];
}

#pragma mark lazy loading...
-(UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.estimatedRowHeight = 230;
        _tableView.rowHeight = UITableViewAutomaticDimension;
    }
    return _tableView;
}

#pragma tableView--delegate
#pragma tableView
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identify = @"cellIdentify";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identify];
    }
    cell.imageView.image = [UIImage imageNamed:@"iconSmall.png"];
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    cell.textLabel.text = @"这就没什么好说的了，苹果自己帮你把动态行高计算了，所有乱七八糟的都不用管了。 但是暂时说这些基本没用，因为现在还看不到哪个公司的项目不适配iOS7，就算出了iOS9感觉也不会让你直接适配iOS8的，iOS7还会存在相当长一段时间";
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark--webView
-(UIWebView *)webView {
    if (!_webView) {
        _webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 50, SCREEN_WIDTH, SCREEN_HEIGHT)];
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
    
}

/** error */
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
