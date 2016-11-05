//
//  KConstSize.h
//  FunctionTest
//
//  Created by Chenfy on 16/8/26.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#ifndef KConstSize_h
#define KConstSize_h

//*************************************************************************
/*
 *  全局数据设置
 */
/** 屏幕尺寸参数 */
#define SCREEN_WIDTH        [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT       [UIScreen mainScreen].bounds.size.height

/** 边缘尺寸 */
#define Space   10

/** 除去导航的尺寸 */
#define MAINVIEW_HEIGHT (SCREEN_HEIGHT - 64)

#define NAVIGATIONBAR_HEIGHT 44.0f
#define STATUSBAR_HEIGHT 20.0f
#define NAVBAR_STATUE_HEIGHT 64.0f
#define SCREEN_SCALE SCREEN_WIDTH/320.0f

//默认坐标相关宏定义
#define NavigationBar_HEIGHT 44
#define UILABEL_DEFAULT_FONT_SIZE 20.0f


#endif /* KConstSize_h */
