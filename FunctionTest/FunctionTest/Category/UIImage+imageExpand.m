//
//  UIImage+imageExpand.m
//  FunctionTest
//
//  Created by Chenfy on 16/8/26.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#import "UIImage+imageExpand.h"
#import <float.h>
#import "UIColor+colorExpand.h"

@implementation UIImage (imageExpand)

+(UIImage *)imageScaleImage:(UIImage *)image {
    image = [image stretchableImageWithLeftCapWidth:floorf(image.size.width/2) topCapHeight:floorf(0)];
    return image;
}

/** 电子签章部分 */
#pragma mark--处理图片变为灰度
+(UIImage *)modifyImageToGray:(UIImage *)image {
    CGSize size = image.size;
    CGRect rect = CGRectMake(0.0f, 0.0f, image.size.width,
                             image.size.height);
    // Create a mono/gray color space
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
    CGContextRef context = CGBitmapContextCreate(nil, size.width,
                                                 size.height, 8, 0, colorSpace, kCGBitmapByteOrderDefault);
    CGColorSpaceRelease(colorSpace);
    // Draw the image into the grayscale context
    CGContextDrawImage(context, rect, [image CGImage]);
    CGImageRef grayscale = CGBitmapContextCreateImage(context);
    CGContextRelease(context);
    // Recover the image
    UIImage *img = [UIImage imageWithCGImage:grayscale];
    CFRelease(grayscale);
    return img;
}

#pragma mark--图片合成函数
+(UIImage *)drawImMainImage:(UIImage *)mainImage withImage:(UIImage *)image {
    UIGraphicsBeginImageContext(mainImage.size);
    // Draw mainImage
    [mainImage drawInRect:CGRectMake(0, 0, mainImage.size.width, mainImage.size.height)];
    int h = image.size.height;
    int y = (mainImage.size.height - h)/2;
    // Draw image
    [image drawInRect:CGRectMake(0, y, image.size.width, image.size.height)];
    UIImage *resultingImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resultingImage;
}



+ (UIImage *)stretchableImage:(UIImage *)img
  resizableImageWithCapInsets:(UIEdgeInsets)insets {
    UIImage *image = nil;
    if ([[[UIDevice currentDevice] systemVersion] floatValue] < 6.0) {
        image = [img stretchableImageWithLeftCapWidth:insets.left topCapHeight:insets.top];
    } else {
        image = [img resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch];
    }
    return image;
}

/**
 *  根据颜色生成图片
 *
 *  @param color 十六进制的颜色字符串
 *  @param size  图片尺寸
 *
 *  @return 图片
 */
+ (UIImage *)imageWithColorHexString:(NSString *)color withSize:(CGSize)size {
    UIGraphicsBeginImageContextWithOptions(size, 0, [UIScreen mainScreen].scale);
    [[UIColor colorFromHexRGB:color] set];
    UIRectFill((CGRect){CGPointZero, size.width, size.height});
    UIImage *pressedColorImg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return pressedColorImg;
}


+ (UIImage *)imageWithColor:(UIColor *)color withSize:(CGSize)size {
    UIGraphicsBeginImageContextWithOptions(size, 0, [UIScreen mainScreen].scale);
    [color set];
    UIRectFill((CGRect){CGPointZero, size.width, size.height});
    UIImage *pressedColorImg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return pressedColorImg;
}


@end
