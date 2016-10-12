//
//  CycleScrollView.m
//  CycleScrollView
//
//  Created by Chenfy on 16/9/22.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#import "CycleScrollView.h"

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
#pragma mark -- 展示Cell定义，用于展示轮播图
@interface  CycleCell: UICollectionViewCell
@property(nonatomic,strong)UIImageView  *imageV;
@property(nonatomic,assign)NSInteger    index;
@property(nonatomic,strong)UIImage      *image;

@end

@implementation CycleCell
/** 初始化*/
- (instancetype)init {
    self = [super init];
    if (self) {
        [self initCycleCell];
    }
    return self;
}
/** frame初始化 */
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initCycleCell];
    }
    return self;
}
/** 内容初始化 */
- (void)initCycleCell {
    [self.contentView addSubview:self.imageV];
}
/** 视图容器 */
- (UIImageView *)imageV {
    if (!_imageV) {
        _imageV = [[UIImageView alloc]init];
        _imageV.contentMode = UIViewContentModeScaleAspectFit;
        _imageV.userInteractionEnabled = YES;
        _imageV.backgroundColor = [UIColor whiteColor];
    }
    return _imageV;
}
/** 绘制视图 */
- (void)layoutSubviews {
    [super layoutSubviews];
    self.imageV.frame = self.contentView.bounds;
}
/** 填充图片 */
- (void)setImage:(UIImage *)image {
    _image = image;
    _imageV.image = image;
}
@end

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
#pragma mark -- 展示View
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
@interface CycleScrollView ()<UICollectionViewDelegate,UICollectionViewDataSource>
/** 图片数据 */
@property(nonatomic,strong)NSArray              *arrayImages;
/** 轮播图组 */
@property(nonatomic,strong)NSMutableArray       *arrayCellData;
/** 图片数量 */
@property(nonatomic,assign)NSInteger            imageCount;

@property(nonatomic,strong)UIPageControl        *pageControl;
@property(nonatomic,strong)NSTimer              *timer;
@property(nonatomic,strong)NSLock               *mLock;
@property(nonatomic,strong)UICollectionView     *collectionView;

@end
/** Cell重用id */
static NSString *cell_id = @"cellCycle";

@implementation CycleScrollView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initCycle:frame];
    }
    return self;
}
 /** 视图初始化*/
- (void)initCycle:(CGRect)frame {
    UICollectionViewFlowLayout  *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize = frame.size;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.minimumLineSpacing = 0.0f;
    flowLayout.minimumInteritemSpacing = 0.0f;
    flowLayout.sectionInset = UIEdgeInsetsZero;
    
    self.collectionView = [[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout:flowLayout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.pagingEnabled = YES;
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.alwaysBounceVertical = NO;
    self.collectionView.alwaysBounceHorizontal = NO;
    [self addSubview:self.collectionView];
    [self.collectionView registerClass:[CycleCell class] forCellWithReuseIdentifier:cell_id];
    
    int pageControl_h = 30;
    self.pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, self.bounds.size.height - pageControl_h, self.bounds.size.width, pageControl_h)];
    self.pageControl.userInteractionEnabled = NO;
    self.pageControl.tag = 100;
    [self addSubview:self.pageControl];
    /** 兼容横竖屏处理 － 需要引入第三方库 Masonary */
    //    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.edges.mas_equalTo(self);
    //    }];

    self.mLock = [[NSLock alloc]init];
    self.backgroundColor = [UIColor purpleColor];
}

#pragma mark - **************** UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _arrayCellData.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CycleCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cell_id forIndexPath:indexPath];
    NSInteger index = [_arrayCellData[indexPath.row] integerValue];
    cell.image = _arrayImages[index];
    cell.index = index;
    return cell;
}
#pragma mark - **************** UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    CycleCell *cell = (CycleCell *)[collectionView cellForItemAtIndexPath:indexPath];
    if ([self.delegate respondsToSelector:@selector(cycleScrollView:clicked:)]) {
        [self.delegate cycleScrollView:self clicked:cell.index];
    }
}
#pragma mark - **************** UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    // 动画停止, 重新定位到第 50 组模型
    int inc = ((int)(scrollView.contentOffset.x / scrollView.frame.size.width)) % _imageCount;
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:50 * _imageCount + inc inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    // 设置 PageControl
    self.pageControl.currentPage = inc;
}
#pragma mark - **************** Function
/** 开启动画 */
- (void)startTimer {
    if (_duringTime > 0.5 && _imageCount > 1) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:_duringTime target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
    }
}
/** 停止动画 */
- (void)stopTimer {
    if (self.timer) {
        [self.timer invalidate];
    }
}
/** 图片轮播 */
- (void)onTimer {
    if (self.arrayCellData.count > 0) {
        NSArray *array = [self.collectionView indexPathsForVisibleItems];
        if (array.count == 0) return ;

        NSIndexPath *indexPath = array[0];
        NSInteger row = indexPath.row;
        if (row % _imageCount == 0) {
            // 重新定位
            row = 50 * _imageCount;
        }
        [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:row + 1 inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
        self.pageControl.currentPage = (row + 1) % _imageCount;
    }
}
/** 设置图片轮播间隔 */
- (void)setDuringTime:(NSTimeInterval)duringTime {
    if (duringTime < 0.001) {
        return;
    }
    _duringTime = duringTime;
    [self stopTimer];
    [self startTimer];
}
/** 设置要轮播的图片数组 */
- (void)setImages:(NSArray *)imageArray {
    [self.mLock lock];
    _arrayImages = imageArray;
    _imageCount = [imageArray count];
    //如果没有设置图片，支持默认图
    if (_imageCount == 0) {
        _arrayImages = @[[UIImage imageNamed:@"cycleDefault.png"]];
        _imageCount = [_arrayImages count];
        self.collectionView.scrollEnabled = NO;
    } else {
        self.collectionView.scrollEnabled = YES;
    }
    
    // 生成数据源
    self.arrayCellData = [[NSMutableArray alloc] init];
    for (int i = 0; i < 100; i++) {
        for (int j = 0; j <_imageCount; j++) {
            [self.arrayCellData addObject:@(j)];
        }
    }
    [self.collectionView reloadData];
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:50 * _imageCount inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    
    // 设置 PageControl
    self.pageControl.hidden = _imageCount > 1 ? NO : YES;
    self.pageControl.numberOfPages = _imageCount;
    self.pageControl.currentPage = 0;
    
    [self startTimer];
    [self.mLock unlock];
}


@end
