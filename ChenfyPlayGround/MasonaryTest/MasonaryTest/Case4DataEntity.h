//
//  Case4DataEntity.h
//  MasonaryTest
//
//  Created by Chenfy on 16/8/3.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Case4DataEntity : NSObject

@property(nonatomic,strong)UIImage  *imageTitle;
@property(nonatomic,copy)NSString   *title;
@property(nonatomic,copy)NSString   *content;

@property(nonatomic,assign)float    cellHeight;

@end
