//
//  CustomPushAnimation.m
//  ViewControllerAnimation
//
//  Created by Chenfy on 16/10/10.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#import "CustomPushAnimation.h"

@implementation CustomPushAnimation

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 2.0;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    //起始viewcontroller
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    //目的viewcontroller
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    

    [[transitionContext containerView]insertSubview:toVC.view belowSubview:fromVC.view];
    //自定义动画
    toVC.view.transform = CGAffineTransformMakeTranslation(320, 568);
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        fromVC.view.transform = CGAffineTransformMakeTranslation(-320, -568);
        toVC.view.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        fromVC.view.transform = CGAffineTransformIdentity;
        // 声明过渡结束时调用 completeTransition: 这个方法
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        
    }];

}


@end
