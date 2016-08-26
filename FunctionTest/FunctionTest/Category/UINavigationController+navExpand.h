//
//  UINavigationController+navExpand.h
//  FunctionTest
//
//  Created by Chenfy on 16/8/26.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (navExpand)

/**
 *  找到指定的视图控制器
 *
 *  @param viewControllerType 控制器名称
 *
 *  @return 指定的视图控制器
 */
- (id)getSpecificViewController:(Class)viewControllerType;

@end
