//
//  KPublicConst.h
//  FunctionTest
//
//  Created by Chenfy on 16/8/24.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#ifndef KPublicConst_h
#define KPublicConst_h


//*************************************************************************
/*
 *屏幕尺寸参数
 */
#define SCREEN_WIDTH        [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT       [UIScreen mainScreen].bounds.size.height

//*************************************************************************
/** iOS 去掉日志 */

#ifndef __OPTIMIZE__

#define NSLog(...) NSLog(__VA_ARGS__)

#else

#define NSLog(...){}

#endif

//打开Xcode -->>product -->scheme -->>edit scheme -->info 设置debug or release

//*************************************************************************




#endif /* KPublicConst_h */
