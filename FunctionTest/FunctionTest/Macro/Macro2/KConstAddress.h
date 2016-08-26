//
//  KConstAddress.h
//  FunctionTest
//
//  Created by Chenfy on 16/8/26.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#ifndef KConstAddress_h
#define KConstAddress_h

//*************************************************************************
/*
 * 地址设置模版
 */
//医网签业务地址：
#define SERVER  2

#if(SERVER == 1)  //!< 开发联调环境
//业务
const static NSString * SERVER_ADDRESS = @"http://60.247.77.124:8080";

#elif(SERVER == 2)  //!<测试环境
//业务
const static NSString * SERVER_ADDRESS = @"http://192.168.135.243:8080";

#elif(SERVER == 3)  //!<集成环境
//业务
const static NSString * SERVER_ADDRESS = @"http://123.56.26.178:8080";

#endif

#endif /* KConstAddress_h */
