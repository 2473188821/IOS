//
//  NewNavigationView.h
//  qq
//
//  Created by Chenfy on 16/11/25.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NewsNavigationView;

typedef NS_ENUM(NSInteger,NewsNavType) {
    NewsNavTypeBack = 1 << 0,
    NewsNavTypeNext = 1 << 1,
    NewsNavTypeVote = 1 << 2,
    NewsNavTypeShare = 1 << 3,
    NewsNavTypeMsg = 1 << 4
};

/** view导航的代理 */
@protocol NewsNavDelegate <NSObject>

- (void)newsNavClicked:(NewsNavigationView *)navView type:(NewsNavType)type;

@end


@interface NewsNavigationView : UIView

@property(nonatomic,weak)id<NewsNavDelegate> delegate;
@property(nonatomic,strong)NSNumber     *id;

@end
