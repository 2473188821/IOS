//
//  CCProgressView.h
//  qq
//
//  Created by Chenfy on 16/11/4.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CCProgressView : UIView
@property(nonatomic,strong)UILabel                  *labelText;

/**  */
+ (CCProgressView *)progressAllocForView:(UIView *)view;

/**
 展示等待框
 */
- (void)showProgressView:(BOOL)animated;

/**
 移除等待框
 */
- (void)hideProgressView:(BOOL)animated;


/** 展示等待框 */
+ (void)showProgressForView:(UIView *)view animated:(BOOL)animated;

/** 移除等待框 */
+ (void)hideProgressForView:(UIView *)view animated:(BOOL)animated;

/** 获取视图展示的progressView */
+ (CCProgressView *)progressForView:(UIView *)view;




@end
