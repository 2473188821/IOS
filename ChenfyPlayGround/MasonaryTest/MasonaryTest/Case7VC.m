//
//  Case7VC.m
//  MasonaryTest
//
//  Created by Chenfy on 16/8/1.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#import "Case7VC.h"
#import "Masonry.h"

/*
 *屏幕尺寸参数
 */
#define SCREEN_WIDTH        [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT       [UIScreen mainScreen].bounds.size.height

#define Parallax_Height    253

@interface Case7VC()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>

@property(nonatomic,strong)UITableView  *tableView;
@property(nonatomic,strong)UIImageView  *imageTitle;

@property(nonatomic,strong)MASConstraint    *parallasMAS;

@end

@implementation Case7VC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor = [UIColor grayColor];
    [self initImageView];

    [self.view addSubview:self.tableView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
}

- (void)initImageView {
    _imageTitle = [UIImageView new];
    _imageTitle.image = [UIImage imageNamed:@"head.jpg"];
    _imageTitle.contentMode = UIViewContentModeScaleToFill;
    [self.view addSubview:_imageTitle];
    
    [_imageTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).offset(0);
        make.right.mas_equalTo(self.view.mas_right).offset(0);
        make.top.mas_equalTo(self.mas_topLayoutGuide);
        make.width.mas_equalTo(200);
        _parallasMAS = make.height.mas_equalTo(Parallax_Height);
    }];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (_parallasMAS == nil) {
        return;
    }
    float contentOffSet = scrollView.contentOffset.y;
    NSLog(@"ContentOFfSet--:%f",contentOffSet);
    if (contentOffSet < - Parallax_Height) {
//        if (contentOffSet < 0) {

        _parallasMAS.mas_equalTo(-contentOffSet);
    } else {
        _parallasMAS.mas_equalTo(Parallax_Height);
    }
}




-(UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
        _tableView.contentInset = UIEdgeInsetsMake(Parallax_Height, 0, 0, 0);
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}

#pragma tableView--delegate
#pragma tableView
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identify = @"case8Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identify];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"index:%d",indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}



@end
