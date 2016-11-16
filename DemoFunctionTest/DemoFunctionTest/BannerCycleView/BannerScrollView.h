//
//  BannerScrollView.h
//  qq
//
//  Created by Chenfy on 16/11/15.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BannerViewDelegate <NSObject>

- (void)bannerViewClicked:(int)index;

@end

@interface BannerScrollView : UIView

@property(nonatomic,assign)id<BannerViewDelegate>delegate;

@property(nonatomic,strong)NSArray  *arrayImages;
@property(nonatomic,assign)CGFloat  durationTime;

/** 开始循环展示 */
- (void)startCycleView;

@end

