//
//  Header.h
//  FunctionTest
//
//  Created by Chenfy on 16/9/6.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#ifndef Header_h
#define Header_h

#define     替代预处理宏
#include	从另一个文件中插入一个特定的头
#undef      取消定义预处理宏
#ifdef      如果定义了这个宏返回true
#ifndef     返回true，如果该宏没有被定义
#if         编译时间条件下的测试，如果是true
#else       #if 替代方案
#elif       #else 和 #if 在一个语句
#endif      结束预处理条件
#error      stderr上打印错误消息
#pragma     编译器使用一个标准化的方法发出特殊命令



#define MAX_ARRAY_LENGTH 20

#undef  FILE_SIZE
#define FILE_SIZE 42

#ifndef MESSAGE
#define MESSAGE "You wish!"
#endif




//预定义宏
//ANSI C定义了一些宏。虽然每一个都是供编程使用，预定义宏不应该被直接修改。

Macro	描述
__DATE__	The current date as a character literal in "MMM DD YYYY" format
__TIME__	The current time as a character literal in "HH:MM:SS" format
__FILE__	This contains the current filename as a string literal.
__LINE__	This contains the current line number as a decimal constant.
__STDC__	Defined as 1 when the compiler complies with the ANSI standard.



宏通常必须包含在一个单一的行。宏延续运算符用于继续宏的一行。例如：
//Stringize (#)
#define  message_for(a, b)
NSLog(@#a " and " #b ": We love you!
      ")


//标记粘贴 (##)
#define tokenpaster(n) NSLog (@"token" #n " = %d", token##n)



/** 文件处理 */
文件处理在 NSFileManager类的帮助下可实现大多数文件操作功能。

文件处理的方法
下面列出的方法用于访问和操作文件列表。在这里，我们必须替换， FilePath1, FilePath2 和 FilePath 我们所需的完整的文件路径字符串，以获得所需的动作。

检查一个路径文件是否存在
NSFileManager *fileManager = [NSFileManager defaultManager];
//Get documents directory
NSArray *directoryPaths = NSSearchPathForDirectoriesInDomains
(NSDocumentDirectory, NSUserDomainMask, YES);
NSString *documentsDirectoryPath = [directoryPaths objectAtIndex:0];
if ([fileManager fileExistsAtPath:@""]==YES) {
    NSLog(@"File exists");
}
比较两个文件的内容
if ([fileManager contentsEqualAtPath:@"FilePath1" andPath:@" FilePath2"]) {
    NSLog(@"Same content");
}
检查是否可写，可读和可执行
if ([fileManager isWritableFileAtPath:@"FilePath"]) {
    NSLog(@"isWritable");
}
if ([fileManager isReadableFileAtPath:@"FilePath"]) {
    NSLog(@"isReadable");
}
if ( [fileManager isExecutableFileAtPath:@"FilePath"]){
    NSLog(@"is Executable");
}
移动文件
if([fileManager moveItemAtPath:@"FilePath1"
                        toPath:@"FilePath2" error:NULL]){
    NSLog(@"Moved successfully");
}
复制文件
if ([fileManager copyItemAtPath:@"FilePath1"
                         toPath:@"FilePath2"  error:NULL]) {
    NSLog(@"Copied successfully");
}
删除文件
if ([fileManager removeItemAtPath:@"FilePath" error:NULL]) {
    NSLog(@"Removed successfully");
}
读取文件




NSData *data = [fileManager contentsAtPath:@"Path"];
写文件
[fileManager createFileAtPath:@"" contents:data attributes:nil];

#endif /* Header_h */
