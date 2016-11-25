//
//  NewNavigationView.m
//  qq
//
//  Created by Chenfy on 16/11/25.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#import "NewsNavigationView.h"


#define KLightBlue    [UIColor colorWithRed:84/255.0 green:178/255.0 blue:229/255.0 alpha:1]

/** 订制的按钮 */
@interface KKButton : UIButton

@property(nonatomic,strong)UILabel      *labelNum;
@property(nonatomic,strong)UIImageView  *imageV;

+ (KKButton *)buttonWithImage:(NSString *)imageName tag:(NewsNavType)type;

@end

@implementation KKButton
/** 初始化 */
- (instancetype)init {
    self = [super init];
    if (self) {
        [self addSubview:self.imageV];
        [self addSubview:self.labelNum];
    }
    return self;
}
/** 显示数目 */
- (UILabel *)labelNum {
    if (!_labelNum) {
        _labelNum = [[UILabel alloc]init];
        _labelNum.font = [UIFont systemFontOfSize:8];
        _labelNum.textAlignment = NSTextAlignmentCenter;
        _labelNum.backgroundColor = KLightBlue;
    }
    return _labelNum;
}
- (UIImageView *)imageV {
    if (!_imageV) {
        _imageV = [[UIImageView alloc]init];
    }
    return _imageV;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    int width = self.bounds.size.width;
    int height = self.bounds.size.height;
    int space  = 10;
    _labelNum.frame = CGRectMake(width * 0.65, height * 0.2, width * 0.3, 12);
    _imageV.frame = CGRectMake(space *2 , space, width - space *4, height - space *2);
}
/** 实例化 */
+ (KKButton *)buttonWithImage:(NSString *)imageName tag:(NewsNavType)type {
    KKButton *btn = [[KKButton alloc]init];
    btn.tag = type;
    btn.backgroundColor = [UIColor yellowColor];
    UIImage *img = [UIImage imageNamed:imageName];
    btn.imageV.image = img;
    return btn;
}

@end

@interface NewsNavigationView()

@property(nonatomic,strong)UILabel      *labelSeperate;

@property(nonatomic,strong)KKButton     *buttonBack;
@property(nonatomic,strong)KKButton     *buttonNext;
@property(nonatomic,strong)KKButton     *buttonVote;
@property(nonatomic,strong)KKButton     *buttonShare;
@property(nonatomic,strong)KKButton     *buttonMsg;

@end

@implementation NewsNavigationView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.buttonBack];
        [self addSubview:self.buttonNext];
        [self addSubview:self.buttonVote];
        [self addSubview:self.buttonShare];
        [self addSubview:self.buttonMsg];
        [self addSubview:self.labelSeperate];
    }
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    int widthTotal = self.bounds.size.width;
    int heightTotal = self.bounds.size.height;
    int width_btn = widthTotal/5 , height_btn = heightTotal;
    CGRect frameTemp = CGRectMake(0, 0, width_btn, height_btn);
    self.buttonBack.frame = frameTemp;
    frameTemp.origin.x +=width_btn;
    self.buttonNext.frame = frameTemp;
    frameTemp.origin.x += width_btn;
    self.buttonVote.frame = frameTemp;
    frameTemp.origin.x += width_btn;
    self.buttonShare.frame = frameTemp;
    frameTemp.origin.x += width_btn;
    self.buttonMsg.frame = frameTemp;
    self.labelSeperate.frame = CGRectMake(0, 0, widthTotal, 1.0);
}

- (void)setId:(NSNumber *)id {
    _id = id;
    self.buttonVote.labelNum.text = @"123";
    self.buttonMsg.labelNum.text = @"456";
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (UILabel *)labelSeperate {
    if (!_labelSeperate) {
        _labelSeperate = [[UILabel alloc]init];
        _labelSeperate.backgroundColor = [UIColor lightGrayColor];
        _labelSeperate.alpha = 0.6;
    }
    return _labelSeperate;
}
- (KKButton *)buttonBack {
    if (!_buttonBack) {
        _buttonBack = [KKButton buttonWithImage:@"iccc" tag:NewsNavTypeBack];
        [_buttonBack addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _buttonBack;
}
- (KKButton *)buttonNext {
    if (!_buttonNext) {
        _buttonNext = [KKButton buttonWithImage:@"iccc" tag:NewsNavTypeNext];
        [_buttonNext addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _buttonNext;
}
- (KKButton *)buttonVote {
    if (!_buttonVote) {
        _buttonVote = [KKButton buttonWithImage:@"icbc" tag:NewsNavTypeVote];
        [_buttonVote addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _buttonVote;
}
- (KKButton *)buttonShare {
    if (!_buttonShare) {
        _buttonShare = [KKButton buttonWithImage:@"icbc" tag:NewsNavTypeShare];
        [_buttonShare addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _buttonShare;
}
- (KKButton *)buttonMsg {
    if (!_buttonMsg) {
        _buttonMsg = [KKButton buttonWithImage:@"iccc" tag:NewsNavTypeMsg];
        [_buttonMsg addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _buttonMsg;
}
/** button Click */
- (void)buttonClicked:(KKButton *)sender {
    if ([self.delegate respondsToSelector:@selector(newsNavClicked:type:)]) {
        [self.delegate newsNavClicked:self type:sender.tag];
    }
}

@end
