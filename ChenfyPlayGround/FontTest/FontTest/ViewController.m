//
//  ViewController.m
//  FontTest
//
//  Created by Chenfy on 16/9/16.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic,strong)UILabel  *labelFont;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dispatch_queue_t q = dispatch_get_main_queue();
    
    NSLog(@"卡死了吗？");
    
    dispatch_sync(q, ^{
        NSLog(@"我来了");
    });
    
    NSLog(@"董铂然 come here");
    
    
    [self testLabel];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark - **************** label test
- (void)testLabel {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(preferredContentSizeChanged:)
                                                 name:UIContentSizeCategoryDidChangeNotification
                                               object:nil];

    _labelFont = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 200, 30)];
    _labelFont.backgroundColor = [UIColor grayColor];
    _labelFont.text = @"你好，中国！";
    UIFont *font = [UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
    _labelFont.font = font;
    [self.view addSubview:_labelFont];
}


- (void)preferredContentSizeChanged:(NSNotification *)notification{
    NSLog(@"cheny-99-:");
    UIFont *font = [UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
    _labelFont.font = font;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
