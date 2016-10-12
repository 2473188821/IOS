//
//  CustomPresentAnimation.h
//  ViewControllerAnimation
//
//  Created by Chenfy on 16/10/10.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum {
    AnimationTypePresent,
    AnimationTypeDismiss
}AnimationType;

@interface CustomPresentAnimation : NSObject<UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign) AnimationType animationType;

@end
