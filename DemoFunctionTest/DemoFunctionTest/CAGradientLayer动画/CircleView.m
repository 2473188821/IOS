//
//  CircleView.m
//  CoPod
//
//  Created by Chenfy on 16/12/9.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#import "CircleView.h"

// 将常数转换为度数
#define   DEGREES(degrees)  ((M_PI * (degrees))/ 180.f)

@interface CircleView()

@property(nonatomic,strong)CAShapeLayer     *layerShape;
@property(nonatomic,strong)CAGradientLayer  *layerGradient;
@property(nonatomic,strong)UIBezierPath     *bezierpath;

@property(nonatomic,strong)NSTimer          *timer;


@end

@implementation CircleView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initBaseLayer];
    }
    return self;
}

- (void)initBaseLayer {
    [self.layer addSublayer:self.layerShape];
    [self.layer addSublayer:self.layerGradient];
}

- (void)startAnimation {
   self.timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(updateProcess) userInfo:nil repeats:YES];
}

- (void)updateProcess {
    NSLog(@"123");
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"locations"];
    animation.fromValue = @[@-0.1,@-0.2,@-0.3];
    animation.toValue = @[@1.0,@1.5,@1.9];
    animation.duration = 1.5;
    
    [self.layerGradient addAnimation:animation forKey:nil];
}

- (void)stopAnimation {
    if ([self.timer isValid]) {
        [self.timer invalidate];
        self.timer = nil;
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (CAShapeLayer *)layerShape {
    if (!_layerShape) {
        _layerShape = [CAShapeLayer layer];
        _layerShape.strokeColor = [UIColor redColor].CGColor;
        _layerShape.lineWidth = 1.0;
        _layerShape.fillColor = [UIColor clearColor].CGColor;
        _layerShape.path = self.bezierpath.CGPath;
    }
    return _layerShape;
}

- (CAGradientLayer *)layerGradient {
    if (!_layerGradient) {
        _layerGradient = [CAGradientLayer layer];
        _layerGradient.backgroundColor = [UIColor orangeColor].CGColor;
        _layerGradient.colors = @[(__bridge id)[UIColor redColor].CGColor,
                                  (__bridge id)[UIColor whiteColor].CGColor,
                                  (__bridge id)[UIColor redColor].CGColor];
        _layerGradient.frame = self.bounds;
        _layerGradient.locations = @[@-0.1,@-0.2,@-0.3];
        _layerGradient.startPoint = CGPointMake(0, 0);
        _layerGradient.endPoint = CGPointMake(1, 0);
        _layerGradient.mask = self.layerShape;
    }
    return _layerGradient;
}

- (UIBezierPath *)bezierpath {
    if (!_bezierpath) {
        _bezierpath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2) radius:(self.bounds.size.width/2 - 3) startAngle:DEGREES(0) endAngle:DEGREES(360) clockwise:YES];
    }
    return _bezierpath;
}


@end
