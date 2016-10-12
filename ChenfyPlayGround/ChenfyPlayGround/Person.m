//
//  Person.m
//  TTTCC
//
//  Created by Chenfy on 16/8/16.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#import "Person.h"

@implementation Person

- (Person *)personRun {
    NSLog(@" I am run!");
    return self;
}

- (Person *)personSay {
    NSLog(@" I am say!");
    return self;
}

- (Person *)personDrink {
    NSLog(@" I am drink!");
    return self;
}

- (Person *(^)())personSleep {
    Person *(^block)() = ^(){
        NSLog(@"personSleep");
        return self;
    };
    return block;
}

- (Person *(^)())personEat {
    Person *(^block)() = ^(){
        NSLog(@"personEat");
        return self;
    };
    return block;
}



@end
