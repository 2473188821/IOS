//
//  ViewController.m
//  DemoFunctionTest
//
//  Created by Chenfy on 16/11/16.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#import "ViewController.h"
#import "BannerViewController.h"
#import "WaitViewController.h"
#import "VersionViewController.h"
#import "DailyNewsViewController.h"
#import "CAGreadientViewController.h"

/** 屏幕尺寸参数 */
#define SCREEN_WIDTH        [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT       [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)NSArray      *arrayDataSource;
@property(nonatomic,strong)UITableView  *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"控件测试用例";
    [self initBaseData];
    [self initBaseView];
    // Do any additional setup after loading the view, typically from a nib.
}
#pragma mark - **************** 初始化操作
- (void)initBaseData {
    self.arrayDataSource = @[@"Banner展示－UIScrollView",@"等待框的显示",@"App版本升级监测",@"知呼日报底部导航视图",@"CAGradientLayer动画"];
}

- (void)initBaseView {
    [self.view addSubview:self.tableView];
}


#pragma mark lazy loading...
-(UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

#pragma tableView--delegate
#pragma tableView
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.arrayDataSource count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identify = @"cellIdentify";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identify];
    }
    cell.textLabel.text = self.arrayDataSource[indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0: {
            [self functionBannerScrollView];
        }
            break;
        case 1: {
            [self functionWaitView];
        }
            break;
        case 2: {
            [self functionVersionControl];
        }
            break;
        case 3: {
            [self functionDailyNewsNav];
        }
            break;
        case 4: {
            [self functionGreadientLayerAnimation];
        }
            break;
        case 5: {
            
        }
            break;
        case 6: {
            
        }
            break;
        case 7: {
            
        }
            break;
        default:
            break;
    }
}
//-----------function
- (void)functionBannerScrollView {
    BannerViewController *ban = [BannerViewController new];
    [self.navigationController pushViewController:ban animated:YES];
}
- (void)functionWaitView {
    WaitViewController *waitVC = [WaitViewController new];
    [self.navigationController pushViewController:waitVC animated:YES];
}
- (void)functionVersionControl {
    VersionViewController *vv = [VersionViewController new];
    [self.navigationController pushViewController:vv animated:YES];
}
- (void)functionDailyNewsNav {
    DailyNewsViewController *dailyVC = [DailyNewsViewController new];
    [self.navigationController pushViewController:dailyVC animated:YES];
}
- (void)functionGreadientLayerAnimation {
    CAGreadientViewController *vcL = [CAGreadientViewController new];
    [self.navigationController pushViewController:vcL animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
