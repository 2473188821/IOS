//
//  ViewController.m
//  ViewControllerAnimation
//
//  Created by Chenfy on 16/10/10.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "CustomPushAnimation.h"
#import "CustomPopAnimation.h"

#import "ThirdViewController.h"
#import "CustomPresentAnimation.h"


@interface ViewController ()<UINavigationControllerDelegate,UIViewControllerTransitioningDelegate,UIViewControllerInteractiveTransitioning>
{
    CustomPushAnimation     *customPush;
    CustomPopAnimation      *customPop;
    CustomPresentAnimation  *customPresent;
    
    SecondViewController    *secondVC;
    ThirdViewController     *thirdVC;
    
    UIPercentDrivenInteractiveTransition *interactionController;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    
    self.navigationController.delegate = self;
    customPush = [CustomPushAnimation new];
    customPop = [CustomPopAnimation new];
    
    customPresent = [CustomPresentAnimation new];
    // Push
    UIButton *pushButton = [UIButton buttonWithType:UIButtonTypeSystem];
    pushButton.frame = CGRectMake(140, 200, 40, 40);
    [pushButton setTitle:@"Push" forState:UIControlStateNormal];
    [pushButton addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pushButton];
    
    
    // Present
    UIButton *presentButton = [UIButton buttonWithType:UIButtonTypeSystem];
    presentButton.frame = CGRectMake(110, 400, 100, 40);
    [presentButton setTitle:@"Present" forState:UIControlStateNormal];
    [presentButton addTarget:self action:@selector(present) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:presentButton];
    
    //交互式动画
    UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(didClickPanGestureRecognizer:)];
    [self.navigationController.view addGestureRecognizer:panRecognizer];
    
    // Do any additional setup after loading the view, typically from a nib.
}

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//Nav
- (void)push {
    secondVC = [SecondViewController new];
    [self.navigationController pushViewController:secondVC animated:YES];
}

- (id<UIViewControllerAnimatedTransitioning>) navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    /**
     *  typedef NS_ENUM(NSInteger, UINavigationControllerOperation) {
     *     UINavigationControllerOperationNone,
     *     UINavigationControllerOperationPush,
     *     UINavigationControllerOperationPop,
     *  };
     */
    //push的时候用我们自己定义的customPush
    if (operation == UINavigationControllerOperationPush) {
        return customPush;
    } if (operation == UINavigationControllerOperationPop) {
        return customPop;
    } else {
        return nil;
    }
}

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//Present
- (void)present {
    thirdVC = [ThirdViewController new];
    thirdVC.transitioningDelegate = self;
    [self presentViewController:thirdVC animated:YES completion:^{
        
    }];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    customPresent.animationType = AnimationTypePresent;
    return customPresent;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    customPresent.animationType = AnimationTypeDismiss;
    return customPresent;
}

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//交互式动画
#pragma mark - 手势交互的主要实现--->UIPercentDrivenInteractiveTransition
- (void)didClickPanGestureRecognizer:(UIPanGestureRecognizer*)recognizer {
    UIView* view = self.view;
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        interactionController = [[UIPercentDrivenInteractiveTransition alloc] init];
        [self presentViewController:thirdVC animated:YES completion:nil];
    } else if (recognizer.state == UIGestureRecognizerStateChanged) {
        CGPoint translation = [recognizer translationInView:view];
        CGFloat distance = fabs(translation.x / CGRectGetWidth(view.bounds));
        [interactionController updateInteractiveTransition:distance];
    } else if (recognizer.state == UIGestureRecognizerStateEnded) {
        CGPoint translation = [recognizer translationInView:view];
        CGFloat distance = fabs(translation.x / CGRectGetWidth(view.bounds));
        if (distance > 0.5) {
            [interactionController finishInteractiveTransition];
        } else {
            [interactionController cancelInteractiveTransition];
        }
        interactionController = nil;
    }
}

- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id<UIViewControllerAnimatedTransitioning>)animator {
    return interactionController;
}

- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator {
    return nil;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
