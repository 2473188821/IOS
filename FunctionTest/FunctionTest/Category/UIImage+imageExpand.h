//
//  UIImage+imageExpand.h
//  FunctionTest
//
//  Created by Chenfy on 16/8/26.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (imageExpand)

//缩放处理图片
/**
 *  将图片缩放
 *
 *  @param image 原图片
 *
 *  @return 新生成的图片
 */
+(UIImage *)imageScaleImage:(UIImage *)image;

/** 电子签章部分 */
#pragma mark--处理图片变为灰度
/**
 *  将彩图转换为灰图
 *
 *  @param image 原图片
 *
 *  @return 新生成的图片
 */
+(UIImage *)modifyImageToGray:(UIImage *)image;

#pragma mark--图片合成函数
/**
 *  将2张图片合成一张
 *
 *  @param mainImage 主图片
 *  @param image     辅助图片
 *
 *  @return 新生成的图片
 */
+(UIImage *)drawImMainImage:(UIImage *)mainImage withImage:(UIImage *)image;


+ (UIImage *)stretchableImage:(UIImage *)img
  resizableImageWithCapInsets:(UIEdgeInsets)insets;

/**
 *  根据颜色生成图片
 *
 *  @param color 十六进制的颜色字符串
 *  @param size  图片尺寸
 *
 *  @return 图片
 */
+ (UIImage *)imageWithColorHexString:(NSString *)color withSize:(CGSize)size;

/**
 *  根据颜色生成图片
 *
 *  @param color uicolor
 *  @param size  图片尺寸
 *
 *  @return 图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color withSize:(CGSize)size;

/**
 *  调整图片的尺寸
 *
 *  @param image      原始图片
 *  @param targetSize 目的尺寸
 *
 *  @return 修改后的图片
 */
+ (UIImage *)image:(UIImage*)image byScalingToSize:(CGSize)targetSize;


@end
