//
//  CCProgressView.m
//  qq
//
//  Created by Chenfy on 16/11/4.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#import "CCProgressView.h"

static const CGFloat    CCDefaultPadding = 10.0f;
static const CGFloat    CCDefaultLableFontSize = 12.0f;
static const CGFloat    CCDefaultDetailsLabelFontSize = 12.0f;

static const CGFloat    CCDefaultHeight     = 100.0f;
static const CGFloat    CCDefaultWidth      = 100.0f;
static const CGFloat    CCDefaultCornerRadius = 10;
static const CGFloat    CCDefaultAnimateDuration = 0.2;


#define KCCColorClear         [UIColor clearColor]
#define KCCColorWhite         [UIColor whiteColor]
#define KCCColorBlack         [UIColor blackColor]
#define KCCColorGray          [UIColor grayColor]
#define KCCColorGrayLight     [UIColor lightGrayColor]
#define KCCColorTextLight     [UIColor lightTextColor]
#define KCCColorRGB(r,g,b)   \
[UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]

#define KCCColorRGBA(r,g,b,a) \
[UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

@interface CCProgressView()
@property(nonatomic,strong)UIView                   *viewBG;
@property(nonatomic,strong)UIView                   *viewBGMain;

@property(nonatomic,strong)UIView                   *viewSuper;

@property(nonatomic,strong)UIActivityIndicatorView  *viewWait;

@end

@implementation CCProgressView

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//--   实例化
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
+ (CCProgressView *)progressAllocForView:(UIView *)view {
    CCProgressView *pView = [[CCProgressView alloc]initWithFrame:view.bounds];
    pView.viewSuper = view;
    return pView;
}

- (void)setViewSuper:(UIView *)viewSuper {
    _viewSuper = viewSuper;
    [self initProgressView];
}

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//--  function
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
/**
 展示等待框
 */
- (void)showProgressView:(BOOL)animated {
    if (animated) {
        [self showAnimate];
        return;
    }
    [self.viewSuper addSubview:self];
    [self.viewWait startAnimating];
}
- (void)showAnimate {
    [self.viewSuper addSubview:self];
    self.transform = CGAffineTransformMakeScale(0, 0);
    [UIView animateWithDuration:CCDefaultAnimateDuration animations:^{
        self.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        if (finished) {
            [self.viewWait startAnimating];
        }
    }];
}
/**
 移除等待框
 */
- (void)hideProgressView:(BOOL)animated {
    if (animated) {
        [self hideAnimate];
        return;
    }
    [self.viewWait stopAnimating];
    [self removeFromSuperview];
}
- (void)hideAnimate {
    [UIView animateWithDuration:CCDefaultAnimateDuration animations:^{
        self.transform = CGAffineTransformMakeScale(0.001, 0.001);
    } completion:^(BOOL finished) {
        if (finished) {
            [self.viewWait stopAnimating];
            [self removeFromSuperview];
        }
    }];
}
/** 展示等待框 */
+ (void)showProgressForView:(UIView *)view animated:(BOOL)animated {
    CCProgressView *pView = [self progressForView:view];
    if (!pView) {
        pView = [self progressAllocForView:view];
    }
    [pView showProgressView:animated];
}
/** 移除等待框 */
+ (void)hideProgressForView:(UIView *)view animated:(BOOL)animated {
    CCProgressView *pView = [self progressForView:view];
    if (pView) {
        [pView hideProgressAnimate:animated];
    }
}
/** 获取视图展示的progressView */
+ (CCProgressView *)progressForView:(UIView *)view {
    NSEnumerator *enumerator = [view.subviews reverseObjectEnumerator];
    for (UIView *subView in enumerator) {
        if ([subView isKindOfClass:self]) {
            return (CCProgressView *)subView;
        }
    }
    return nil;
}
/** 等待框的展示 */
- (void)showProgressAnimate:(BOOL)animated {
    [self showProgressView:animated];
}
- (void)hideProgressAnimate:(BOOL)animated {
    [self hideProgressView:animated];
}

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//--    View init
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
/** 初始化基本视图 */
- (void)initProgressView {
    [self addSubview:self.viewBGMain];
    [self addSubview:self.viewBG];
    [self.viewBG addSubview:self.viewWait];
    [self.viewBG addSubview:self.labelText];
}
- (UIView *)viewBGMain {
    if (!_viewBGMain) {
        _viewBGMain = [[UIView alloc]initWithFrame:self.viewSuper.bounds];
        _viewBGMain.backgroundColor = KCCColorBlack;
        _viewBGMain.alpha = 0.4;
    }
    return _viewBGMain;;
}
//背景视图
- (UIView *)viewBG {
    if (!_viewBG) {
        _viewBG = [[UIView alloc]initWithFrame:CGRectMake(0, 0, CCDefaultWidth, CCDefaultHeight)];
        _viewBG.backgroundColor = KCCColorBlack;
        _viewBG.alpha = 0.8;
        _viewBG.layer.cornerRadius = CCDefaultCornerRadius;
        _viewBG.clipsToBounds = YES;
        _viewBG.center = self.viewBGMain.center;
    }
    return _viewBG;
}
- (UIActivityIndicatorView *)viewWait {
    if (!_viewWait) {
        _viewWait = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        _viewWait.hidesWhenStopped = YES;
        _viewWait.backgroundColor = KCCColorClear;
        _viewWait.frame = CGRectMake(0, 0, CCDefaultWidth, self.viewBG.frame.size.height*0.8);
        _viewWait.layer.cornerRadius = CCDefaultCornerRadius;
        [_viewWait addSubview:self.labelText];
    }
    return _viewWait;
}
- (UILabel *)labelText {
    if (!_labelText) {
        int lable_y = self.viewWait.frame.size.height - 10;
        int label_w = self.viewWait.frame.size.width - 20;
        _labelText = [[UILabel alloc]initWithFrame:CGRectMake(0, lable_y,label_w , 20)];
        CGPoint centerTemp = _labelText.center;
        centerTemp.x = self.viewWait.center.x;
        _labelText.center = centerTemp;
        _labelText.textAlignment = NSTextAlignmentCenter;
        _labelText.numberOfLines = 0;
        _labelText.lineBreakMode = NSLineBreakByCharWrapping;
        _labelText.font = [UIFont systemFontOfSize:CCDefaultLableFontSize];
        _labelText.text = @"请稍后...";
        _labelText.textColor = KCCColorWhite;
    }
    return _labelText;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
