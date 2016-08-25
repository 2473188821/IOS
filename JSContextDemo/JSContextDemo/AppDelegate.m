//
//  AppDelegate.m
//  JSContextDemo
//
//  Created by Chenfy on 16/8/25.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "ModelViewController.h"
#import "WkWebViewController.h"
#import "ios7Bridge/Ios7BridgeViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    UITabBarController *tabbar = [[UITabBarController alloc]init];
    
    UINavigationController *navCustom = [[UINavigationController alloc]initWithRootViewController:[ViewController new]];
    navCustom.tabBarItem.title = @"Custom";
    UINavigationController *navModel = [[UINavigationController alloc]initWithRootViewController:[ModelViewController new]];
    navModel.tabBarItem.title = @"Model";
    
    UINavigationController *navWk = [[UINavigationController alloc]initWithRootViewController:[WkWebViewController new]];
    navWk.tabBarItem.title = @"WKWebView";
    
    UINavigationController *navIOS = [[UINavigationController alloc]initWithRootViewController:[Ios7BridgeViewController new]];
    navIOS.tabBarItem.title = @"WebView";
    
    UINavigationController *navI = [[UINavigationController alloc]initWithRootViewController:[Ios7BridgeViewController new]];
    navI.tabBarItem.title = @"thirdSDK";


    tabbar.viewControllers = @[navCustom,navModel,navWk,navIOS,navI];
    self.window.rootViewController = tabbar;
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
