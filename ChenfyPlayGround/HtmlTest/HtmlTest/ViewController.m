//
//  ViewController.m
//  HtmlTest
//
//  Created by Chenfy on 16/9/5.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#import "ViewController.h"
#import "HTools.h"

#import <dispatch/dispatch.h>

@interface ViewController ()<UIPopoverControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addHtmlLabelTest];
    [self popViewControllerTest];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

/** UIPopoverController的使用 */
- (void)popViewControllerTest {
    UIButton *btn = [HTools createButtonFrame:CGRectMake(100, 100, 100, 50) title:@"pop VC!" target:self action:@selector(buttonPopClicked)];
    [self.view addSubview:btn];
}

- (void)buttonPopClicked {
    UIViewController *viewController = [[UIViewController alloc]init];
    viewController.view.backgroundColor = [UIColor greenColor];
    viewController.contentSizeForViewInPopover = CGSizeMake(400, 400);
   
    UIPopoverController  *popoverController = [[UIPopoverController alloc]initWithContentViewController:viewController];
    popoverController.delegate = self;
    popoverController.popoverContentSize = CGSizeMake(400, 100);
    CGRect rect = CGRectMake(100, 280, 0, 0);
    [popoverController presentPopoverFromRect:rect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
}
//dispatch test
- (void)tes {
    NSArray *array = @[];
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_group_t group = dispatch_group_create();
    for(id obj in array)
        dispatch_group_async(group, queue, ^{
            [self doSomethingIntensiveWith:obj];
        });
    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
    [self doSomethingIntensiveWith:array];
}

- (void)doSomethingIntensiveWith:(id)object {
    NSLog(@"doSomethingIntensiveWith called !");
}

/** 原生UI加载html文本 */
- (void)addHtmlLabelTest {
    UILabel *label = [HTools createLabelFrame:self.view.bounds backGroundColor:[UIColor yellowColor] textColor:[UIColor blackColor]];
    label.numberOfLines = 0;
    label.lineBreakMode = NSLineBreakByWordWrapping;
    
    NSString * htmlString = @"<html><body> Some html string  <font size=\"5\" color=\"red\">This is some text!</font> </body></html>";

    NSAttributedString * attrStr = [[NSAttributedString alloc] initWithData:[htmlString dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
    label.attributedText = attrStr;
    [self.view addSubview:label];
}

-(void)dealloc {

    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
