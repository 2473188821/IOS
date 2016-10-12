//
//  CustomPopAnimation.m
//  ViewControllerAnimation
//
//  Created by Chenfy on 16/10/10.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#import "CustomPopAnimation.h"

@implementation CustomPopAnimation

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 2.0;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    //目的ViewController
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    //起始ViewController
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    //添加toView到上下文
    [[transitionContext containerView] insertSubview:toViewController.view belowSubview:fromViewController.view];
    //自定义动画
    toViewController.view.transform = CGAffineTransformMakeTranslation(0, -568);
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        fromViewController.view.transform = CGAffineTransformMakeTranslation(0, 568);
        toViewController.view.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        fromViewController.view.transform = CGAffineTransformIdentity;
        // 声明过渡结束时调用 completeTransition: 这个方法
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}

@end
