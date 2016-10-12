//
//  Case8Cell.h
//  MasonaryTest
//
//  Created by Chenfy on 16/8/4.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Case8Cell;
@class Case8DataEntity;

typedef void(^ClickedBlock) ();

@interface Case8Cell : UITableViewCell

- (void)setEntityData:(Case8DataEntity *)data indexPath:(NSIndexPath *)indexP click:(ClickedBlock)block;

@end
