//
//  JSPatch.h
//  JSPatch
//
//  Created by bang on 15/11/14.
//  Copyright (c) 2015 bang. All rights reserved.
//

#import <Foundation/Foundation.h>

const static NSString *rootUrl = @"http://192.168.199.101:8080";
//static NSString *publicKey = @"-----BEGIN PUBLIC KEY-----\nMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC+1xcYsEE+ab/Ame1/HHAgfBRh\nD67I9mBYCiOJqC3lJX5RKFvtOTcF5Sf5Bz3NL/2QWPLu40+yt4EvjZ3HOUAHrVgo\n2Fjo4vpaRoEaEtaccOziPH/ASScOfL+uppNGOa0glTCZLKVZI3Go8zoutr8VDw2d\nNT7rDM/4TvPjwMYd3QIDAQAB\n-----END PUBLIC KEY-----";

  static NSString *publicKey = @"-----BEGIN PUBLIC KEY-----\nMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC5qjCPJ/4tmXkydHkKCSH23xSY\njUQYI0vDl3RWvOlSen3ZX7ACVwysbjLBSXJSKHVt826++vy+Q1I4VAcO8OIJg+xq\n/Lk+DxPffBoNrIoOg9Ky45nsozmMV3h5TUTQfB++zROtWncNkugLiKytQZJ+MGk/\ns9HLzGBHcn/d59IOZwIDAQAB\n-----END PUBLIC KEY-----";

typedef void (^JPUpdateCallback)(NSError *error);

typedef enum {
    JPUpdateErrorUnzipFailed = -1001,
    JPUpdateErrorVerifyFailed = -1002,
} JPUpdateError;

@interface JPLoader : NSObject
+ (BOOL)run;
+ (void)updateToVersion:(NSInteger)version callback:(JPUpdateCallback)callback;
+ (void)runTestScriptInBundle;
+ (void)setLogger:(void(^)(NSString *log))logger;
+ (NSInteger)currentVersion;
@end