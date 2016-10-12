//
//  AppDelegate.m
//  HotFixTest
//
//  Created by Chenfy on 16/8/29.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#import "AppDelegate.h"
#import <JSPatch/JPEngine.h>
#import <JSPatch/JSPatch.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //==============================================
    //JSPatch SDK集成方式
    //==============================================
    //http://jspatch.com/Apps/stat/appID/5482/av/1.0/pv/1/type/day

    //＋＋ JSPatch平台加载
    [JSPatch startWithAppKey:@"a4cc33e39ff1fa88"];
    #ifdef DEBUG
//    [JSPatch setupDevelopment];
    #endif
    [JSPatch sync];
    
    //＋＋ JSPatch平台测试
//    [JSPatch testScriptInBundle];
    
    //==============================================
    //JSPatch 原文件集成方式
    //==============================================
    
    //＋＋ 采用JPEngine文件测试
    //[JPEngine startEngine];

    //＋＋ 本地加载
    //NSString *path = [[NSBundle mainBundle]pathForResource:@"demo" ofType:@"js"];
    //NSString *jsString = [[NSString alloc]initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    //[JPEngine evaluateScript:jsString];

    //＋＋ 服务器加载
    //NSURL *url = [NSURL URLWithString:@"http://127.0.0.1:8080/demo.js"];
    //NSURLRequest *request = [NSURLRequest requestWithURL:url];
    //[NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
//        NSString *script = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//        [JPEngine evaluateScript:script];
//    }];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
