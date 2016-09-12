//
//  MessageTools.m
//  FunctionTest
//
//  Created by Chenfy on 16/9/8.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#import "MessageTools.h"
#import <UIKit/UIKit.h>
//#import "MBProgressHUD.h"
#import "KHeaderConst.h"

#define KTips       @"提示"
#define KSure       @"确定"
#define KCancel     @"取消"

@interface MessageTools()
DEFINE_SINGLETON_FOR_HEADER(MessageTools);

//@property(nonatomic,strong)MBProgressHUD    *HUD;
@property(nonatomic,strong)UIView           *bgView;
@end

@implementation MessageTools



/** 单例实现 */
DEFINE_SINGLETON_FOR_CLASS(MessageTools);

//提示消息
+(void)showMessage:(NSString *)message {
    dispatch_async(dispatch_get_main_queue(), ^{
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:KTips message:message delegate:nil cancelButtonTitle:KCancel otherButtonTitles:KSure, nil];
        [alert show];
    });
}

//单个按钮的提示消息
+(void)showMessageWithSure:(NSString *)message {
    dispatch_async(dispatch_get_main_queue(), ^{
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:KTips message:message delegate:nil cancelButtonTitle:nil otherButtonTitles:KSure, nil];
        [alert show];
    });
}

/** 等待框的展示 */
+(void)showViewHUD:(NSString *)message {
//    CAWaitClass *waitView = [CAWaitClass sharedCAWaitClass];
//    UIWindow *keyWindow = [[UIApplication sharedApplication]keyWindow];
//    waitView.bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
//    waitView.backgroundColor = [UIColor colorWithRed:.16 green:.17 blue:.21 alpha:.9];
//    [keyWindow addSubview:waitView.bgView];
//    
//    waitView.HUD = [[MBProgressHUD alloc] initWithWindow:keyWindow];
//    waitView.HUD.frame = CGRectMake(0, 0, SCREEN_WIDTH/2, SCREEN_HEIGHT/2);
//    waitView.HUD.center = waitView.bgView.center;
//    waitView.HUD.labelText = message;
//    [waitView.bgView addSubview:waitView.HUD];
//    [waitView.bgView bringSubviewToFront:waitView.HUD];
//    [waitView.HUD show:YES];
}
/** 移除等待框 */
+(void)hideViewHUD {
//    CAWaitClass *waitView = [CAWaitClass sharedCAWaitClass];
//    [waitView.bgView removeFromSuperview];
//    [waitView.HUD removeFromSuperview];
//    waitView.bgView = nil;
//    waitView.HUD = nil;
}



@end
