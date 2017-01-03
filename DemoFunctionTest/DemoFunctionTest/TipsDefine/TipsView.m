//
//  MessageView.m
//  rtyu
//
//  Created by Chenfy on 16/12/26.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#import "TipsView.h"

/** 屏幕尺寸参数 */
#define SCREEN_WIDTH        [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT       [UIScreen mainScreen].bounds.size.height

#define BGView_Width    260
#define BGView_Height   170
#define Corner_Radious  2.5

#define Height_Default  40
#define Button_cancel_size  30

#define BGColor     @"#ebebeb"
#define LineColor   @"d9d9d9"
#define FontColor   @"#404040"

#define FontSizeTitle    30/2
#define FontSizeContent  26/2

@interface CancelButton : UIButton

@end

@implementation CancelButton

- (void)drawRect:(CGRect)rect {
    //获取上下文
    [self drawCancelLine];
}
/** 绘制X图形 */
- (void)drawCancelLine {
    //1.获取上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    //2.设置当前上下问路径
    //设置起始点
    CGContextMoveToPoint(context, 10, 10);
    //增加点
    CGContextAddLineToPoint(context, Button_cancel_size - 10, Button_cancel_size - 10);
    
    CGContextMoveToPoint(context, Button_cancel_size - 10, 10);
    CGContextAddLineToPoint(context, 10, Button_cancel_size - 10);

    [[UIColor lightGrayColor]setStroke];
    CGContextSetLineWidth(context, 2.5);
    //4.绘制路径
    CGContextDrawPath(context, kCGPathFillStroke);
}

@end

@interface TipsView()
@property(nonatomic,copy)UIView     *viewBg;
@property(nonatomic,strong)UILabel  *labelTitle;
@property(nonatomic,strong)UILabel  *lableContent;
@property(nonatomic,strong)UIButton *btn;
@property(nonatomic,strong)CancelButton *btnCancel;

@property(nonatomic,strong)UILabel  *labelSeparateUp;
@property(nonatomic,strong)UILabel  *labelSeparateDown;

@property(nonatomic,copy)NSString   *textTitle;
@property(nonatomic,copy)NSString   *textContent;


@end

@implementation TipsView

+ (void)showTitle:(NSString *)title message:(NSString *)msg {
    TipsView *view = [[TipsView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    view.textTitle = title;
    view.textContent = msg;
    UIWindow *keyWindow = [[UIApplication sharedApplication]keyWindow];
    [keyWindow addSubview:view];
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
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.8];
        [self addSubview:self.viewBg];
        [self.viewBg addSubview:self.labelTitle];
        [self.viewBg addSubview:self.lableContent];
        [self.viewBg addSubview:self.btnCancel];
        [self.viewBg addSubview:self.btn];
        [self.viewBg addSubview:self.labelSeparateUp];
        [self.viewBg addSubview:self.labelSeparateDown];
    }
    return self;
}

- (void)setTextTitle:(NSString *)textTitle {
    if (nil == textTitle) {
        textTitle = @"提示";
    }
    _textTitle = textTitle;
    _labelTitle.text = textTitle;
//    [_labelTitle sizeToFit];
}
- (void)setTextContent:(NSString *)textContent {
    _textContent = textContent;
    _lableContent.text = textContent;
    [_lableContent sizeToFit];
}
/** 重新布局 */
- (void)layoutSubviews {
    int height_labelContent = self.lableContent.frame.size.height;
    int default_height = 60;
    if (height_labelContent < default_height) {
        CGRect frameContent = self.lableContent.frame;
        frameContent.size.height = default_height;
        //设置文字居中显示
        frameContent.size.width = BGView_Width - 10;
        self.lableContent.frame = frameContent;
    }

    _labelSeparateUp.frame = CGRectMake(0, self.labelTitle.frame.origin.y + self.labelTitle.frame.size.height - 0, BGView_Width - 0, 1);
    _labelSeparateDown.frame = CGRectMake(0, self.lableContent.frame.origin.y + self.lableContent.frame.size.height + 10, BGView_Width - 0, 1);
    _btn.frame = CGRectMake(0, self.labelSeparateDown.frame.origin.y + 5, BGView_Width, Height_Default);
    
    CGRect frameS = self.viewBg.frame;
    frameS.size.height = _btn.frame.origin.y + Height_Default;
    self.viewBg.frame = frameS;
    self.viewBg.center = self.center;
}

- (UIView *)viewBg {
    if (!_viewBg) {
        _viewBg = [[UIView alloc]initWithFrame:CGRectMake(0, 0, BGView_Width, BGView_Height)];
        _viewBg.backgroundColor = [self colorWithHexString:BGColor];
        _viewBg.layer.cornerRadius = Corner_Radious;
        _viewBg.center = self.center;
    }
    return _viewBg;
}
- (UILabel *)labelTitle {
    if (!_labelTitle) {
        _labelTitle = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, BGView_Width, Height_Default)];
        _labelTitle.textAlignment = NSTextAlignmentCenter;
        _labelTitle.font = [UIFont systemFontOfSize:FontSizeTitle];
        _labelTitle.textColor = [self colorWithHexString:FontColor];
        _labelTitle.text = @"title";
    }
    return _labelTitle;
}
- (UILabel *)lableContent {
    if (!_lableContent) {
        _lableContent = [[UILabel alloc]initWithFrame:CGRectMake(10,self.labelSeparateUp.frame.origin.y + 8, BGView_Width - 20, BGView_Height - 90)];
        _lableContent.textAlignment = NSTextAlignmentCenter;
        _lableContent.font = [UIFont systemFontOfSize:FontSizeContent];
        _lableContent.textColor = [self colorWithHexString:FontColor];
        _lableContent.numberOfLines = 0;
        _lableContent.lineBreakMode = NSLineBreakByCharWrapping;
        _lableContent.text = @"content";
    }
    return _lableContent;
}
- (UIButton *)btn {
    if (!_btn) {
        _btn = [UIButton buttonWithType:UIButtonTypeCustom];
        _btn.frame = CGRectMake(0, BGView_Height - Height_Default, BGView_Width, Height_Default);
        _btn.titleLabel.font = [UIFont systemFontOfSize:FontSizeTitle];
        [_btn setTitleColor:[self colorWithHexString:FontColor] forState:UIControlStateNormal];
        [_btn setTitle:@"确定" forState:UIControlStateNormal];
        [_btn addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn;
}
- (void)buttonClicked {
    for (UIView *view in [self subviews]) {
        [view removeFromSuperview];
    }
    [self removeFromSuperview];
}

- (CancelButton *)btnCancel {
    if (!_btnCancel) {
        int btnSize = Button_cancel_size;
        _btnCancel = [CancelButton buttonWithType:UIButtonTypeCustom];
        _btnCancel.frame = CGRectMake(BGView_Width - btnSize, 0, btnSize, btnSize);
        [_btnCancel addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btnCancel;
}


- (UILabel *)labelSeparateUp {
    if (!_labelSeparateUp) {
        _labelSeparateUp = [self createLabel:CGRectMake(0, self.labelTitle.frame.origin.y + self.labelTitle.frame.size.height - 0, BGView_Width - 0, 1)];
        _labelSeparateUp.backgroundColor = [self colorWithHexString:LineColor];
    }
    return _labelSeparateUp;
}
- (UILabel *)labelSeparateDown {
    if (!_labelSeparateDown) {
        _labelSeparateDown = [self createLabel:CGRectMake(0, self.lableContent.frame.origin.y + self.lableContent.frame.size.height + 10, BGView_Width - 0, 1)];
        _labelSeparateDown.backgroundColor = [self colorWithHexString:LineColor];
    }
    return _labelSeparateDown;
}

// 颜色转换三：iOS中十六进制的颜色（以#开头）转换为UIColor
- (UIColor *) colorWithHexString: (NSString *)color {
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    // 判断前缀并剪切掉
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    // 从六位数值中找到RGB对应的位数并转换
    NSRange range;
    range.location = 0;
    range.length = 2;
    //R、G、B
    NSString *rString = [cString substringWithRange:range];
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
}

- (UILabel *)createLabel:(CGRect)frame {
    UILabel *label = [[UILabel alloc]initWithFrame:frame];
    return label;
}

@end
