//
//  IosProblems.h
//  FunctionTest
//
//  Created by Chenfy on 16/8/24.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#ifndef IosProblems_h
#define IosProblems_h

//************************************
//问题 一
//************************************

Undefined symbols for architecture i386: "_deflate", referenced from:
Undefined symbols for architecture i386:
"_deflate", referenced from:
PlatCompress(enumCompressOperation, CompressCookie*, void*, long) in         libMo.a(tlplatcompress.o)
"_deflateEnd", referenced from:
PlatCompress(enumCompressOperation, CompressCookie*, void*, long) in libMo.a(tlplatcompress.o)
"_deflateInit_", referenced from:
StartCompression(enumCompressOperation, unsigned char, long (*)(void*, void*, long), void*, void**) in libMo.a(tlplatcompress.o)
"_deflateParams", referenced from:
StartCompression(enumCompressOperation, unsigned char, long (*)(void*, void*, long), void*, void**) in libMo.a(tlplatcompress.o)
"_inflate", referenced from:
PlatCompress(enumCompressOperation, CompressCookie*, void*, long) in libMo.a(tlplatcompress.o)
"_inflateEnd", referenced from:
PlatCompress(enumCompressOperation, CompressCookie*, void*, long) in libMo.a(tlplatcompress.o)
"_inflateInit_", referenced from:
StartCompression(enumCompressOperation, unsigned char, long (*)(void*, void*,  long), void*, void**) in libMo.a(tlplatcompress.o)
ld: symbol(s) not found for architecture i386
clang: error: linker command failed with exit code 1 (use -v to see invocation)


遇到这样的错误 。是缺少libz.dylib文件。

Xcode 7.0 之后要手动添加
添加方法：

Go to Build Phases >Link Binary with Librairies > + > Add other
Once in the file selection window do “CMD”+Shift+G (Go to folder) and type /usr/lib/
From /usr/lib you can add : libz.dylib and more…
Compile and have fun


is unavailable no availabel on ios (app extension) - use view controller

Targers-->Build Settings-->Build Options--> Require Only App-Extension-Safe -->NO


//************************************
//问题 二
//************************************

在 iOS9 中现在找不到 XXX.dylib 了，比如libz.tbd  如果要用到 libz.dylib，可以用下面的办法，来自 Stack Overflow。

Go to Build Phases >Link Binary with Librairies > + > Add other
Once in the file selection window do “CMD”+Shift+G (Go to folder) and type /usr/lib/
From /usr/lib you can add : libz.dylib and more…
Compile and have fun


is unavailable no availabel on ios (app extension) - use view controller

Targers-->Build Settings-->Build Options--> Require Only App-Extension-Safe -->NO

#endif /* IosProblems_h */
