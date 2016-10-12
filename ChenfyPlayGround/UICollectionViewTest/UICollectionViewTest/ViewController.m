//
//  ViewController.m
//  UICollectionViewTest
//
//  Created by Chenfy on 16/9/22.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#import "ViewController.h"
#import "MyCell.h"

/** 屏幕尺寸参数 */
#define SCREEN_WIDTH        [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT       [UIScreen mainScreen].bounds.size.height


@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property(nonatomic,strong)UICollectionViewFlowLayout   *customLayout;
@property(nonatomic,strong)UICollectionView             *collectionView;


@end

// 注意const的位置
static NSString *const id_cell = @"cellId";
static NSString *const id_head = @"headerId";
static NSString *const id_foot = @"footerId";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"CollectionView";
    self.view.backgroundColor = [UIColor orangeColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    _customLayout = [[UICollectionViewFlowLayout alloc] init]; // 自定义的布局对象
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 100, SCREEN_WIDTH, 40) collectionViewLayout:self.customLayout];
    
    _collectionView.showsHorizontalScrollIndicator = NO;
    
    _customLayout.itemSize = CGSizeMake(50, 30);
    self.customLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;//注释掉就可以正常回调了。
    
    _collectionView.backgroundColor = [UIColor lightGrayColor];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    [self.view addSubview:_collectionView];
    
    // 注册cell、sectionHeader、sectionFooter
    [_collectionView registerClass:[MyCell class] forCellWithReuseIdentifier:id_cell];
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MyCell *cell = [_collectionView dequeueReusableCellWithReuseIdentifier:id_cell forIndexPath:indexPath];
    cell.backgroundColor = [UIColor purpleColor];
    NSString *itermString = [NSString stringWithFormat:@"%d",indexPath.section];
    cell.label.text = itermString;
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 15;
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(30, 30);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(5, 5, 5, 5);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0.1f;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0.1f;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return (CGSize){2,2};
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    return (CGSize){2,2};
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
