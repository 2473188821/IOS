//
//  CircleRefreshView.h
//  qq
//
//  Created by Chenfy on 16/11/3.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CircleRefreshView : UIView

@property(nonatomic,assign)CGFloat  progress;

//开启加载风火轮
- (void)startActivityView;
//关闭加载风火轮
- (void)stopActivityView;

@end
