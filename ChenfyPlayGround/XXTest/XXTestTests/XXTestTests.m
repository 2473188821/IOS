//
//  XXTestTests.m
//  XXTestTests
//
//  Created by Chenfy on 16/5/31.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Df.h"
#import "CalcuteManager.h"

@interface XXTestTests : XCTestCase

@end

@implementation XXTestTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    [[Df new]showMessage:@""];

    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

-(void)testThatShow {
    [[Df new]showMessage:@""];
}

-(void)testCaluMax {
    NSArray *arr = @[@123 ,@456 ,@12 ,@10721890];
    long long macNum = [CalcuteManager getMax:arr];
    
    XCTAssert(macNum == 10721890 ,@"Error max");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{

        
        // Put the code you want to measure the time of here.
    }];
}

@end
