//
//  Case4Cell.m
//  MasonaryTest
//
//  Created by Chenfy on 16/8/3.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#import "Case4Cell.h"
#import "Masonry.h"
#import "Case4DataEntity.h"

@interface Case4Cell()
@property(nonatomic,strong)UIImageView  *ImageVPortroit;
@property(nonatomic,strong)UILabel     *labelTitle;
@property(nonatomic,strong)UILabel     *labelContent;

@property(nonatomic,strong)Case4DataEntity *entity;

@end

@implementation Case4Cell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initView];
    }
    return self;
}

- (void)initView {
    _ImageVPortroit = [UIImageView new];
    _ImageVPortroit.backgroundColor = [UIColor orangeColor];
    _ImageVPortroit.layer.cornerRadius = 5;
    _ImageVPortroit.clipsToBounds = YES;
    [self.contentView addSubview:_ImageVPortroit];
    int padding = 4;
    int IMAGE_WIDTH = 40;
    [_ImageVPortroit mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(padding);
        make.width.height.mas_equalTo(IMAGE_WIDTH);
    }];
    
    _labelTitle = [UILabel new];
    [self.contentView addSubview:_labelTitle];
    [_labelTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_ImageVPortroit.mas_right).offset(padding);
        make.top.mas_equalTo(_ImageVPortroit.mas_top);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-padding);
    }];
    
    int preMax = [UIScreen mainScreen].bounds.size.width - IMAGE_WIDTH - padding * 3 - 10;
    
    _labelContent = [UILabel new];
    _labelContent.numberOfLines = 0;
    _labelContent.preferredMaxLayoutWidth = preMax;
    
    [self.contentView addSubview:_labelContent];
    [_labelContent mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_ImageVPortroit.mas_right).offset(padding);
        make.top.mas_equalTo(_labelTitle.mas_bottom).offset(padding);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-padding);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-padding);
    }];
}

- (void)setEntityData:(Case4DataEntity *)data {
    _entity = data;
    
    _ImageVPortroit.image = data.imageTitle;
    _labelTitle.text = data.title;
    _labelContent.text = data.content;
}



@end
