//
//  Case4VC.m
//  MasonaryTest
//
//  Created by Chenfy on 16/8/1.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#import "Case4VC.h"
#import "Case4Cell.h"
#import "Case4DataEntity.h"
#import "Masonry.h"

/*
 *屏幕尺寸参数
 */
#define SCREEN_WIDTH        [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT       [UIScreen mainScreen].bounds.size.height

@interface Case4VC()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView      *tableView;
@property(nonatomic,strong)NSMutableArray   *arrayDataModel;

@property(nonatomic,strong)Case4Cell        *templateCell;

@end

@implementation Case4VC

-(void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.tableView];

    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    
    self.arrayDataModel = [NSMutableArray array];
    [self generateDataModel];
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
    NSLog(@"Chenfy--:%lu",(unsigned long)self.arrayDataModel.count);
    return self.arrayDataModel.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    self.templateCell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([Case4Cell class])];
    if (!self.templateCell) {
        self.templateCell = [[Case4Cell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:NSStringFromClass([Case4Cell class])];
    }
    
    Case4DataEntity *entity = self.arrayDataModel[indexPath.row];
    if (entity.cellHeight <= 0) {
        [self.templateCell setEntityData:entity];
        entity.cellHeight = [self.templateCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height + 0.5f;
    }
    NSLog(@"Chenfy--CellHeight--:%f",entity.cellHeight);
    if (entity.cellHeight < 50) {
        return 50;
    }
    return entity.cellHeight;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identify = NSStringFromClass([Case4Cell class]);
    Case4Cell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[Case4Cell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    [cell setEntityData:self.arrayDataModel[indexPath.row]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (void)generateDataModel {
    for (int i = 0 ; i < 50; i++) {
        Case4DataEntity *entity = [Case4DataEntity new];
        
        entity.imageTitle = [UIImage imageNamed:@"icon.png"];
        entity.title = [NSString stringWithFormat:@"Title-%d",i];
        NSString *string = [self getText:@"Content" withRepeat:i];
        entity.content = string;
        [self.arrayDataModel addObject:entity];
    }
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
