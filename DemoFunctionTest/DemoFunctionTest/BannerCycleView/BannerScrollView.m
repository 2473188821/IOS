
//
//  BannerScrollView.m
//  qq
//
//  Created by Chenfy on 16/11/15.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#import "BannerScrollView.h"

#define WIDTH_SELF      (self.bounds.size.width)
#define HEIGHT_SELF     (self.bounds.size.height)
#define SIZE_SELF       (self.bounds.size)

#define Num_MAX         100


#define Label_Height    50
#define Label_Space     20

@interface SingleImageView : UIImageView
@property(nonatomic,strong)UILabel  *labelShow;

@end

@implementation SingleImageView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.labelShow];
    }
    return self;
}
//重新布局
- (void)layoutSubviews {
    [super layoutSubviews];
    self.labelShow.frame = CGRectMake(Label_Space, self.bounds.size.height - 80, self.bounds.size.width - Label_Space*2, Label_Height);
}
- (UILabel *)labelShow {
    if (!_labelShow) {
        _labelShow = [[UILabel alloc]initWithFrame:CGRectMake(Label_Space, self.bounds.size.height - 80, self.bounds.size.width - Label_Space*2, Label_Height)];
        _labelShow.numberOfLines = 0;
        _labelShow.lineBreakMode = NSLineBreakByWordWrapping;
        _labelShow.text = @"你所学的专业是：电气工程；年级是：201电气工程；年级是：2015春；属于驻马店汉学习中心。单击学籍信息可查看或维护电气工程；年级是：2015春；属于驻马店汉学习中心。单击学籍信息可查看或维护5春；属于驻马店汉学习中心。单击学籍信息可查看或维护你的学籍信息。";
//        _labelShow.backgroundColor = [UIColor orangeColor];
    }
    return _labelShow;
}

@end

@interface NSTimer(Expand)

- (void)timerPause;
- (void)timerResume;
- (void)timerResumeAtInterval:(NSTimeInterval)time;

@end

@implementation NSTimer(Expand)
/** timer的控制 */
- (void)timerPause {
    if (![self isValid]) {
        return;
    }
    [self setFireDate:[NSDate distantFuture]];
}

- (void)timerResume {
    if (![self isValid]) {
        return;
    }
    [self setFireDate:[NSDate date]];
}

- (void)timerResumeAtInterval:(NSTimeInterval)time {
    if (![self isValid]) {
        return;
    }
    [self setFireDate:[NSDate dateWithTimeIntervalSinceNow:time]];
}

@end

//默认循环时间
static const CGFloat    BannerDefaultCycleTime = 3.0;

@interface BannerScrollView()<UIScrollViewDelegate>
@property(nonatomic,strong)UIScrollView     *scrollViewBanner;
@property(nonatomic,strong)NSMutableArray   *arrayImageView;

@property(nonatomic,strong)UIPageControl    *pageControl;
@property(nonatomic,strong)NSTimer          *timerBanner;

@property(nonatomic,assign)CGPoint          pointMiddle;
@property(nonatomic,assign)int              numReal;
@property(nonatomic,assign)int              numCreate;

@end

@implementation BannerScrollView

//初始化
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor purpleColor];
        [self bannerAddSubViews];
    }
    return self;
}
//添加子视图
- (void)bannerAddSubViews {
    self.arrayImageView = [NSMutableArray array];
    [self addSubview:self.scrollViewBanner];
    [self addSubview:self.pageControl];
}
//设置子视图
- (void)bannerSetSubViews {
    self.scrollViewBanner.contentSize = CGSizeMake(WIDTH_SELF * _numCreate, HEIGHT_SELF);
    for (int i = 0; i < _numCreate; i ++) {
        UIImage *imag = self.arrayImages[i%_numReal];
        CGRect frame = CGRectMake(WIDTH_SELF * i, 0, WIDTH_SELF, HEIGHT_SELF);
        SingleImageView *imageV = [self createImageView:frame tag:i];
        [self.arrayImageView addObject:imageV];
        imageV.image = imag;
        [self.scrollViewBanner addSubview:imageV];
    }
    CGPoint offsetPoint = CGPointMake(_numReal * (Num_MAX/2) * WIDTH_SELF, 0);
    [self.scrollViewBanner setContentOffset:offsetPoint animated:YES];
}
//重置子视图布局
- (void)bannerResetSubViews {
    for (UIImageView *imgV in self.arrayImageView) {
        CGRect frameImV = imgV.frame;
        frameImV.size = SIZE_SELF;
        imgV.frame = frameImV;
    }
    CGRect framePage = self.pageControl.frame;
    framePage.origin.y = HEIGHT_SELF - 30;
    self.pageControl.frame = framePage;
}
//创建imagev填充
- (SingleImageView *)createImageView:(CGRect)frame tag:(int)tag {
    SingleImageView *imageV = [[SingleImageView alloc]initWithFrame:frame];
    imageV.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imageClicked:)];
    [imageV addGestureRecognizer:tap];
    return imageV;
}
- (void)imageClicked:(SingleImageView *)imgeV {
    if ([self.delegate respondsToSelector:@selector(bannerViewClicked:)]) {
        [self.delegate bannerViewClicked:(int)self.pageControl.currentPage];
    }
}

- (void)layoutSubviews {
    self.scrollViewBanner.frame = self.bounds;
    [self bannerResetSubViews];
}
//循环banner
- (UIScrollView *)scrollViewBanner {
    if (!_scrollViewBanner) {
        _scrollViewBanner = [[UIScrollView alloc]initWithFrame:self.bounds];
        _scrollViewBanner.backgroundColor = [UIColor orangeColor];
        _scrollViewBanner.delegate = self;
        _scrollViewBanner.showsHorizontalScrollIndicator = NO;
        _scrollViewBanner.showsVerticalScrollIndicator = NO;
        _scrollViewBanner.scrollEnabled = YES;
        _scrollViewBanner.pagingEnabled = YES;
    }
    return _scrollViewBanner;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self.timerBanner timerPause];
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    [self.timerBanner timerResumeAtInterval:3];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    int currentPageOffset = (int)(scrollView.contentOffset.x / WIDTH_SELF)%([self.arrayImages count]);
    CGPoint offsetPoint = CGPointMake(((Num_MAX/2) * [self.arrayImages count] + currentPageOffset) * WIDTH_SELF, 0);
    self.pageControl.currentPage = currentPageOffset;
    [scrollView setContentOffset:offsetPoint animated:YES];
    if (currentPageOffset == 0) {
        [scrollView setContentOffset:offsetPoint animated:NO];
    } else {
        [scrollView setContentOffset:offsetPoint animated:YES];
    }
}
//页码
- (UIPageControl *)pageControl {
    if (!_pageControl) {
        CGRect frame = CGRectMake(0, HEIGHT_SELF - 30, WIDTH_SELF, 30);
        _pageControl = [[UIPageControl alloc]initWithFrame:frame];
        _pageControl.numberOfPages = [self.arrayImages count];
        _pageControl.hidesForSinglePage = YES;
    }
    return _pageControl;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
//轮播图数据的设置
- (void)setArrayImages:(NSArray *)arrayImages {
    _arrayImages = arrayImages;
    _pageControl.numberOfPages = [arrayImages count];
    _pageControl.currentPage = 0;
    self.pointMiddle = CGPointMake([arrayImages count] * Num_MAX/2 *WIDTH_SELF, 0);
    self.numReal = (int)[self.arrayImages count];
    self.numCreate = self.numReal * Num_MAX;
    [self bannerSetSubViews];
}
//轮播间隔的设置
- (void)setDurationTime:(CGFloat)durationTime {
    _durationTime = durationTime;
}
/** 开始循环展示 */
- (void)startCycleView {
    if ([self.arrayImages count] == 0) {
        return;
    }
    if (self.durationTime < 0.1) {
        self.durationTime = BannerDefaultCycleTime;
    }
    self.timerBanner = [NSTimer  scheduledTimerWithTimeInterval:self.durationTime target:self selector:@selector(viewBannerScroll) userInfo:nil repeats:YES];
}
- (void)viewBannerScroll {
    int currentPage = (int)self.pageControl.currentPage;
    if (currentPage == [self.arrayImages count] - 1) {
        currentPage = 0;
        [self.scrollViewBanner setContentOffset:self.pointMiddle animated:NO];
    } else {
        currentPage ++;
        CGPoint offsetPoint = CGPointMake((_numCreate/2 + currentPage) * WIDTH_SELF, 0);
        [self.scrollViewBanner setContentOffset:offsetPoint animated:YES];
    }
    self.pageControl.currentPage = currentPage;
}


@end
