//
//  CircleRefreshView.m
//  qq
//
//  Created by Chenfy on 16/11/3.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#import "CircleRefreshView.h"

@interface CircleRefreshView (){
    UIBezierPath     *bezierPathBG;
    CAShapeLayer     *layerBG;
    UIBezierPath     *bezierPathShow;
    CAShapeLayer     *layerShow;
    
//    UIActivityIndicatorView *viewNet;
}
@property(nonatomic,strong)UIColor          *colorBackground;
@property(nonatomic,strong)UIColor          *colorShow;
@property(nonatomic,strong)UIActivityIndicatorView *viewNet;


@end

@implementation CircleRefreshView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self initSubViews:CGRectZero];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initSubViews:frame];
    }
    return self;
}

- (void)initSubViews:(CGRect)frame {
    self.colorBackground = [UIColor lightTextColor];
    self.colorShow = [UIColor whiteColor];
    
    layerBG = [CAShapeLayer new];
    layerBG.fillColor = nil;
    layerBG.lineCap = kCALineCapRound;
    layerBG.frame = self.bounds;
    layerBG.strokeColor = self.colorBackground.CGColor;

    layerShow = [CAShapeLayer new];
    layerShow.fillColor = nil;
    layerShow.frame = self.bounds;
    layerShow.lineCap = kCALineCapRound;
    layerShow.strokeColor = self.colorShow.CGColor;
    
    layerBG.lineWidth = 2.0;
    layerShow.lineWidth = 2.0;
    
    [self.layer addSublayer:layerBG];
    [self.layer addSublayer:layerShow];
    self.progress = 0;
    [self setPathBackGround];
    [self setPathShow];
    
    self.viewNet = [[UIActivityIndicatorView alloc]initWithFrame:self.bounds];
    self.viewNet.hidden = YES;
    self.viewNet.backgroundColor = [UIColor lightTextColor];
    self.viewNet.center = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
    self.viewNet.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    [self addSubview:self.viewNet];
}

- (void)setProgress:(CGFloat)progress {
    _progress = progress;
    [self setPathShow];
}

- (void)setPathBackGround {
    bezierPathBG = [UIBezierPath bezierPathWithOvalInRect:self.bounds];
    layerBG.path = bezierPathBG.CGPath ;
}

- (void)setPathShow {
    bezierPathShow = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.frame.size.width/2, self.frame.size.height/2) radius:self.frame.size.width/2 startAngle:M_PI/2 endAngle:((M_PI * 2)* self.progress)+ M_PI/2 clockwise:YES];
    layerShow.path = bezierPathShow.CGPath;
}

//开启加载风火轮
- (void)startActivityView {
    self.viewNet.hidden = NO;
    [self.viewNet startAnimating];
}

//关闭加载风火轮
- (void)stopActivityView {
    self.viewNet.hidden = YES;
    [self.viewNet stopAnimating];
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
