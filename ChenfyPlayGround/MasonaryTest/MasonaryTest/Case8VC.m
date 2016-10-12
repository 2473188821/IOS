//
//  Case8VC.m
//  MasonaryTest
//
//  Created by Chenfy on 16/8/1.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#import "Case8VC.h"
#import "Case8Cell.h"
#import "Case8DataEntity.h"
#import "Masonry.h"

/*
 *屏幕尺寸参数
 */
#define SCREEN_WIDTH        [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT       [UIScreen mainScreen].bounds.size.height


@interface Case8VC ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *arrayEntity;


@end

@implementation Case8VC

-(void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.tableView];

    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    
    _arrayEntity = [NSMutableArray array];
    [self initData];
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
    return _arrayEntity.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identify = NSStringFromClass([Case8Cell class]);
    Case8Cell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[Case8Cell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identify];
    }
    Case8DataEntity *entity = _arrayEntity[indexPath.row];
    [cell setEntityData:entity indexPath:indexPath click:^() {
        
    }];
    if (entity.cellHeight <= 0) {
        entity.cellHeight = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height + 0.5f;
    }
    if (entity.cellHeight < 50) {
        return 50;
    }
    return entity.cellHeight;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identity = NSStringFromClass([Case8Cell class]);
    Case8Cell *cell = [tableView dequeueReusableCellWithIdentifier:identity];
    if (!cell) {
        cell = [[Case8Cell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identity];
    }
    [cell setEntityData:_arrayEntity[indexPath.row] indexPath:indexPath click:^() {
        Case8DataEntity *entity = _arrayEntity[indexPath.row];
        entity.cellHeight = 0;
        entity.isExpanded = !entity.isExpanded;
        
        [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (void)initData {
    NSMutableArray *tmpData = [NSMutableArray new];
    
    for (int i = 0; i < 20; i++) {
        Case8DataEntity *dataEntity = [Case8DataEntity new];
        dataEntity.content = [self getText:@"case 8 content. " withRepeat:i * 2 + 10];
        [tmpData addObject:dataEntity];
    }
    
    _arrayEntity = tmpData;
}
// 重复text字符串repeat次
- (NSString *)getText:(NSString *)text withRepeat:(int)repeat {
    NSMutableString *tmpText = [NSMutableString new];
    
    for (int i = 0; i < repeat; i++) {
        [tmpText appendString:text];
    }
    
    return tmpText;
}



@end
