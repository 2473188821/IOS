//
//  UIView+viewExpand.h
//  FunctionTest
//
//  Created by Chenfy on 16/8/26.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (viewExpand)

@property (nonatomic, assign) CGFloat   x;  //!<坐标X
@property (nonatomic, assign) CGFloat   y;  //!<坐标Y
@property (nonatomic, assign) CGFloat   centerX;  //!<坐标中心X
@property (nonatomic, assign) CGFloat   centerY;  //!<坐标中心Y
@property (nonatomic, assign) CGFloat   width;  //!<宽度
@property (nonatomic, assign) CGFloat   height;  //!<高度
@property (nonatomic, assign) CGSize    size;  //!<SIZE

-(CGFloat)maxY;
-(CGFloat)maxX;

/** 抓屏 */
-(UIImage *)convertViewToImage;


@end
