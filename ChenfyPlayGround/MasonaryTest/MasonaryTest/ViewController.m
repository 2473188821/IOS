//
//  ViewController.m
//  MasonaryTest
//
//  Created by Chenfy on 16/8/1.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#import "ViewController.h"
#import "Case1VC.h"
#import "Case2VC.h"
#import "Case3VC.h"
#import "Case4VC.h"
#import "Case5VC.h"
#import "Case6VC.h"
#import "Case7VC.h"
#import "Case8VC.h"
#import "Case9VC.h"

/*
 *屏幕尺寸参数
 */
#define SCREEN_WIDTH        [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT       [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.tableView];
    // Do any additional setup after loading the view, typically from a nib.
}

-(UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
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
    return 9;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identify = @"identify";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identify];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"Case %d VC ",indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self showVC:(int)indexPath.row animated:YES];
}

- (void)showVC:(int)num animated:(BOOL)animate {
    switch (num) {
        case 0:
        {
            Case1VC *vc = [Case1VC new];
            [self.navigationController pushViewController:vc animated:animate];
        }
            break;
        case 1:
        {
            Case2VC *vc = [Case2VC new];
            [self.navigationController pushViewController:vc animated:animate];
        }
            break;
        case 2:
        {
            Case3VC *vc = [Case3VC new];
            [self.navigationController pushViewController:vc animated:animate];
        }
            break;
        case 3:
        {
            Case4VC *vc = [Case4VC new];
            [self.navigationController pushViewController:vc animated:animate];
        }
            break;
        case 4:
        {
            Case5VC *vc = [Case5VC new];
            [self.navigationController pushViewController:vc animated:animate];
        }
            break;
        case 5:
        {
            Case6VC *vc = [Case6VC new];
            [self.navigationController pushViewController:vc animated:animate];
        }
            break;
        case 6:
        {
            Case7VC *vc = [Case7VC new];
            [self.navigationController pushViewController:vc animated:animate];
        }
            break;
        case 7:
        {
            Case8VC *vc = [Case8VC new];
            [self.navigationController pushViewController:vc animated:animate];
        }
            break;
        case 8:
        {
            Case9VC *vc = [Case9VC new];
            [self.navigationController pushViewController:vc animated:animate];
        }
            break;

        default:
            break;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
