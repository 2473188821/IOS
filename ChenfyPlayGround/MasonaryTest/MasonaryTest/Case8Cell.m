//
//  Case8Cell.m
//  MasonaryTest
//
//  Created by Chenfy on 16/8/4.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#import "Case8Cell.h"
#import "Case8DataEntity.h"
#import "Masonry.h"

@interface Case8Cell()

@property(nonatomic,copy)ClickedBlock block;

@property(nonatomic,strong)UILabel  *labelTitle;
@property(nonatomic,strong)UILabel  *labelContent;
@property(nonatomic,strong)UIButton *btnMore;

@property(nonatomic,strong)MASConstraint *constraintMAS;

@property(nonatomic,strong)NSIndexPath  *indexPath;
@property(nonatomic,strong)Case8DataEntity  *entity;

@end

@implementation Case8Cell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initView];
    }
    return self;
}

- (void)initView {
    _labelTitle = [UILabel new];
    [self.contentView addSubview:_labelTitle];
    [_labelTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).offset(10);
        make.top.mas_equalTo(self.contentView).offset(5);
        make.right.mas_equalTo(self.contentView).offset(-10);
    }];
    
    int w_content = [UIScreen mainScreen].bounds.size.width - 20;
    
    _labelContent = [UILabel new];
    _labelContent.numberOfLines = 0;
    _labelContent.lineBreakMode = NSLineBreakByCharWrapping;
    _labelContent.preferredMaxLayoutWidth = w_content;
    [self.contentView addSubview:_labelContent];
    
    [_labelContent mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(_labelTitle);
        make.top.mas_equalTo(_labelTitle.mas_bottom).offset(5);
        _constraintMAS = make.height.mas_equalTo(50);
    }];
    
    _btnMore = [UIButton buttonWithType:UIButtonTypeCustom];
    [_btnMore setTitle:@"更 多" forState:UIControlStateNormal];
    [_btnMore setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_btnMore addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:_btnMore];
    [_btnMore mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.contentView);
        make.top.mas_equalTo(_labelContent.mas_bottom).offset(4);
        make.bottom.mas_equalTo(self.contentView).offset(-4);
    }];
    
}

- (void)setEntityData:(Case8DataEntity *)data indexPath:(NSIndexPath *)indexP click:(ClickedBlock)block {
    _entity = data;
    _indexPath = indexP;
    _block = block;
    
    _labelTitle.text = [NSString stringWithFormat:@"index: %ld, contentView: %p", (long) _indexPath.row, (__bridge void *) self.contentView];
    _labelContent.text = data.content;
    if (_entity.isExpanded) {
        [_constraintMAS uninstall];
        [_btnMore setTitle:@"收 起" forState:UIControlStateNormal];
    } else {
        [_btnMore setTitle:@"更 多" forState:UIControlStateNormal];
        [_constraintMAS install];
    }
}

- (void)btnClick {
    self.block();
}


@end
