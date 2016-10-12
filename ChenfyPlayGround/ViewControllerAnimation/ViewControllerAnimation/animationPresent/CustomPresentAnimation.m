//
//  CustomPresentAnimation.m
//  ViewControllerAnimation
//
//  Created by Chenfy on 16/10/10.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#import "CustomPresentAnimation.h"


@implementation CustomPresentAnimation

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 2.0;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController* toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController* fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];

    UIView * toView = toViewController.view;
    UIView * fromView = fromViewController.view;

    if (self.animationType == AnimationTypePresent) {
        //snapshot方法是很高效的截屏
        //First放下面
        UIView * snap = [fromView snapshotViewAfterScreenUpdates:YES];
        [transitionContext.containerView addSubview:snap];
        //Third放上面
        UIView * snap2 = [toView snapshotViewAfterScreenUpdates:YES];
        [transitionContext.containerView addSubview:snap2];
        snap2.transform = CGAffineTransformMakeTranslation(-320, 0);
        //进行动画
        [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
            snap2.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            //删掉截图
            [snap removeFromSuperview];
            [snap2 removeFromSuperview];
            //添加视图
            [[transitionContext containerView] addSubview:toView];
            //结束Transition
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        }];
    } else {
        //First 放下面
        UIView * snap = [toView snapshotViewAfterScreenUpdates:YES];
        [transitionContext.containerView addSubview:snap];
        //Third 放上面
        UIView * snap2 = [fromView snapshotViewAfterScreenUpdates:YES];
        [transitionContext.containerView addSubview:snap2];
        //进行动画
        [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
            snap2.transform = CGAffineTransformMakeTranslation(-320, 0);
        } completion:^(BOOL finished) {
            //删掉截图
            [snap removeFromSuperview];
            [snap2 removeFromSuperview];
            //添加视图
            [[transitionContext containerView] addSubview:toView];
            //结束Transition
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        }];
    }
}

@end
