//
//  VersionView.h
//  qq
//
//  Created by Chenfy on 16/11/22.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,UpdateType){
    //强制更新
    UpdateTypeMust,
    //稍后更新
    UpdateTypeLater,
    //服务维护，停止运营
    UpdateTypeServerStop
};

@interface VersionView : UIView

/**
 版本监测View

 @param title 标题
 @param msg   更新展示信息
 @param type  view类型
 */
+ (void)versionViewShowTitle:(NSString *)title message:(NSString *)msg type:(UpdateType)type;

/**
 版本监测View

 @param message 展示的消息
 @param type    view类型
 */
+ (void)versionViewShow:(NSString *)message type:(UpdateType)type;

/**
 版本监测view隐藏
 */
+ (void)versionViewHide;

@end
