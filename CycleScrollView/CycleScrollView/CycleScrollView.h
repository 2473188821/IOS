//
//  CycleScrollView.h
//  CycleScrollView
//
//  Created by Chenfy on 16/9/22.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CycleScrollView;

@protocol CycleScrollViewDelegate <NSObject>
/** 点击图片回调函数 */
- (void)cycleScrollView:(CycleScrollView *)scrollView clicked:(NSInteger)index;

@end

@interface CycleScrollView : UIView

@property(nonatomic,weak)id<CycleScrollViewDelegate>delegate;
/** 轮播间隔时长 */
@property(nonatomic,assign)NSTimeInterval   duringTime;
/** 设置轮播图片组 */
- (void)setImages:(NSArray *)imageArray;
/** 开启轮播动画 */
- (void)startTimer;
/** 停止轮播动画 */
- (void)stopTimer;


@end
