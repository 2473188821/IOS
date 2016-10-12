//
//  TestCase.m
//  XXTest
//
//  Created by Chenfy on 16/5/31.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#import "TestCase.h"
#import "CalcuteManager.h"

@implementation TestCase


-(void)testM {
    NSArray *arr = @[@123 ,@456 ,@12 ,@10721890];
    long long macNum = [CalcuteManager getMax:arr];
    
    XCTAssert(macNum == 10721890 ,@"Error max");
}

@end
