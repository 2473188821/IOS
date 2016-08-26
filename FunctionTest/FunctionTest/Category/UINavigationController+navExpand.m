//
//  UINavigationController+navExpand.m
//  FunctionTest
//
//  Created by Chenfy on 16/8/26.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#import "UINavigationController+navExpand.h"

@implementation UINavigationController (navExpand)

/**
 *  找到指定的视图控制器
 *
 *  @param viewControllerType 控制器名称
 *
 *  @return 指定的视图控制器
 */
- (id)getSpecificViewController:(Class)viewControllerType {
    int len = (int)self.viewControllers.count;
    for (int i = len - 1; i >= 0; --i) {
        UIViewController *vc = [self.viewControllers objectAtIndex:i];
        if([vc class] == viewControllerType) {
            return vc;
        }
    }
    return nil;
}

@end
