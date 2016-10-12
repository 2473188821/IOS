//
//  Case8DataEntity.h
//  MasonaryTest
//
//  Created by Chenfy on 16/8/4.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Case8DataEntity : NSObject

@property(nonatomic,copy)NSString   *title;
@property(nonatomic,copy)NSString   *content;

@property(nonatomic,assign)BOOL     isExpanded;
@property(nonatomic,assign)float    cellHeight;

@end
