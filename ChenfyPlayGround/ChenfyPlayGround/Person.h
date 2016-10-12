//
//  Person.h
//  TTTCC
//
//  Created by Chenfy on 16/8/16.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

/** iOS函数式编程 && 响应式编程概念 */

/*
 // 函数式编程总结
 
 如果想再去调用别的方法，那么就需要返回一个对象；
 如果想用()去执行，那么需要返回一个block；
 如果想让返回的block再调用对象的方法，那么这个block就需要返回一个对象（即返回值为一个对象的block）。

 // 响应式编程的概念
 
 在网上流传一个非常经典的解释｀响应式编程的概念｀
 在程序开发中：
 a ＝ b ＋ c
 赋值之后 b 或者 c 的值变化后，a 的值不会跟着变化
 响应式编程，目标就是，如果 b 或者 c 的数值发生变化，a 的数值会同时发生变化；
 
 */

#import <Foundation/Foundation.h>

@interface Person : NSObject

/** 函数式编程 */
- (Person *)personRun;
- (Person *)personSay;
- (Person *)personDrink;

/** 响应式编程 */
- (Person *(^)())personSleep;
- (Person *(^)())personEat;

@end
