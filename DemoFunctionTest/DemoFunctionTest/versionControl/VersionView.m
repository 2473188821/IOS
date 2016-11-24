//
//  VersionView.m
//  qq
//
//  Created by Chenfy on 16/11/22.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#import "VersionView.h"

/** 状态语 */
#define KDefaultTitle       @"升级提示"
/** 底部按钮显示 */
#define KUpdateLater        @"下次再说"
#define KUpdateRightNow     @"现在更新"
#define KUpdateServerStop   @"服务器升级维护"
/** App更新的地址 */
#define KUpdateAddress      @"https://itunes.apple.com/cn/app/yi-wang-qian/id1074200788?mt=8"

/** button的背景色 */
#define KButton_BGColor_lightBlue    [UIColor colorWithRed:84/255.0 green:178/255.0 blue:229/255.0 alpha:1]
#define KButton_BGColor_lightRed     [UIColor colorWithRed:220/255.0 green:60/255.0 blue:59/255.0 alpha:1]

/** button字体 */
#define KButton_font                 [UIFont systemFontOfSize:14]
#define KButton_Height               30

@interface VersionView()

@property(nonatomic,strong)UILabel      *labelTitle;
@property(nonatomic,strong)UITextView   *textView;

//@property(nonatomic,copy)NSString       *titleShow;
//@property(nonatomic,copy)NSString       *contentShow;

@property(nonatomic,strong)UIView       *showView;
@property(nonatomic,strong)UIButton     *buttonNext;
@property(nonatomic,strong)UIButton     *buttonNow;
@property(nonatomic,strong)UIButton     *buttonServerStop;

@property(nonatomic,assign)UpdateType   typeUpdate;

@end

@implementation VersionView

+ (void)versionViewShowTitle:(NSString *)title message:(NSString *)msg type:(UpdateType)type {
    [self versionViewShow:msg type:type];
    VersionView *vView = [self getShowVersionView];
    vView.labelTitle.text = title;
}


+ (void)versionViewShow:(NSString *)message type:(UpdateType)type {
    UIWindow *window = [self getKeyWindow];
    VersionView *versionView = [[VersionView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    versionView.typeUpdate = type;
    versionView.textView.text = message;
    versionView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
    [window addSubview:versionView];
}

+ (void)versionViewHide {
    UIView *versionV = [self getShowVersionView];
    if (versionV) {
        [versionV removeFromSuperview];
    }
}

+ (UIWindow *)getKeyWindow {
    return [[UIApplication sharedApplication]keyWindow];
}

+ (VersionView *)getShowVersionView {
    UIWindow *window = [self getKeyWindow];
    NSEnumerator *enumerator = [window.subviews reverseObjectEnumerator];
    for (UIView *subView in enumerator) {
        if ([subView isKindOfClass:self]) {
            return (VersionView *)subView;
        }
    }
    return nil;
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self versionSetBaseView];
    }
    return self;
}

- (void)versionSetBaseView {
    [self addSubview:self.showView];
    [self.showView addSubview:self.labelTitle];
    [self.showView addSubview:self.textView];
    [self.showView addSubview:self.buttonNext];
    [self.showView addSubview:self.buttonNow];
    [self.showView addSubview:self.buttonServerStop];
    
    CGRect frameTemp = self.showView.frame;
    frameTemp.size.height = self.buttonNow.frame.origin.y + self.buttonNow.frame.size.height + 10;
    self.showView.frame = frameTemp;
}

- (void)setTypeUpdate:(UpdateType)typeUpdate {
    _typeUpdate = typeUpdate;
    [self resetBottomButton];
}
- (void)resetBottomButton {
    if (self.typeUpdate == UpdateTypeMust) {
        //默认是强制更新，此处不做处理
    }
    if (self.typeUpdate == UpdateTypeLater) {
        CGRect frameNext = self.buttonNow.frame;
        CGRect frameNow = self.buttonNow.frame;
        
        int space = 10;
        int width = (self.showView.frame.size.width - space * 3)/2;
        
        frameNext.origin.x = space;
        frameNext.size.width = width;
        
        frameNow.origin.x = width + space * 2;
        frameNow.size.width = width;
        
        self.buttonNext.frame = frameNext;
        self.buttonNow.frame = frameNow;
    }
    if (self.typeUpdate == UpdateTypeServerStop) {
        CGRect frameNow = self.buttonNow.frame;
        self.buttonServerStop.frame = frameNow;
        self.buttonNow.frame = CGRectZero;
    }
}

- (UIView *)showView {
    if (!_showView) {
        _showView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width * 0.7, self.bounds.size.height * 0.5)];
        _showView.layer.cornerRadius = 5.0;
        _showView.backgroundColor = [UIColor whiteColor];
        CGPoint centerTemp = self.center;
        centerTemp.y-= 0;
        _showView.center = centerTemp;
    }
    return _showView;
}
- (UILabel *)labelTitle {
    if (!_labelTitle) {
        _labelTitle = [[UILabel alloc]init];
        _labelTitle.frame = CGRectMake(0, 10, self.showView.bounds.size.width, 30);
        _labelTitle.textAlignment = NSTextAlignmentCenter;
        _labelTitle.font = [UIFont systemFontOfSize:14];
        _labelTitle.text = KDefaultTitle;
    }
    return _labelTitle;
}
- (UITextView *)textView {
    if (!_textView) {
        int space = 10;
        _textView = [[UITextView alloc]init];
        _textView.frame = CGRectMake(space, self.labelTitle.frame.origin.y + 30, self.showView.bounds.size.width - space * 2, 80);
        _textView.editable = NO;
        _textView.selectable = NO;
        _textView.textColor = [UIColor grayColor];
    }
    return _textView;
}
/** 下次再说 */
- (UIButton *)buttonNext {
    if (!_buttonNext) {
        _buttonNext = [UIButton buttonWithType:UIButtonTypeCustom];
        [_buttonNext setTitle:KUpdateLater forState:UIControlStateNormal];
        _buttonNext.layer.cornerRadius = 5.0;
        _buttonNext.titleLabel.font = KButton_font;
        [_buttonNext setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _buttonNext.backgroundColor = KButton_BGColor_lightRed;
        [_buttonNext addTarget:self action:@selector(buttonNextClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return _buttonNext;
}

- (void)buttonNextClicked {
    [VersionView versionViewHide];
}

/** 立即更新 */
- (UIButton *)buttonNow {
    if (!_buttonNow) {
        int space = 10;
        _buttonNow = [UIButton buttonWithType:UIButtonTypeCustom];
        _buttonNow.frame = CGRectMake(space, self.textView.frame.origin.y + 80 + space, self.showView.bounds.size.width - space * 2, KButton_Height);
        _buttonNow.layer.cornerRadius = 5.0;
        _buttonNow.titleLabel.font = KButton_font;
        [_buttonNow setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _buttonNow.backgroundColor = KButton_BGColor_lightRed;
        [_buttonNow setTitle:KUpdateRightNow forState:UIControlStateNormal];
        [_buttonNow addTarget:self action:@selector(buttonNowClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return _buttonNow;
}

- (void)buttonNowClicked {
    NSURL *url = [NSURL URLWithString:KUpdateAddress];
    [[UIApplication sharedApplication]openURL:url];
}

/** 服务端升级维护 */
- (UIButton *)buttonServerStop {
    if (!_buttonServerStop) {
        _buttonServerStop = [UIButton buttonWithType:UIButtonTypeCustom];
        _buttonServerStop.layer.cornerRadius = 5.0;
        _buttonServerStop.titleLabel.font = KButton_font;
        [_buttonServerStop setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _buttonServerStop.backgroundColor = KButton_BGColor_lightRed;
        [_buttonServerStop setTitle:KUpdateServerStop forState:UIControlStateNormal];
        [_buttonServerStop addTarget:self action:@selector(buttonServerStopClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return _buttonServerStop;
}
- (void)buttonServerStopClicked {
    [self buttonNextClicked];
}
@end
