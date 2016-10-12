//
//  Case1VC.m
//  MasonaryTest
//
//  Created by Chenfy on 16/8/1.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#import "Case1VC.h"
#import "Masonry/Masonry/Masonry.h"

/*
 *屏幕尺寸参数
 */
#define SCREEN_WIDTH        [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT       [UIScreen mainScreen].bounds.size.height

@interface Case1VC ()

@property(nonatomic,strong)UIView   *viewYellow;
@property(nonatomic,strong)UIView   *viewGreen;
@property(nonatomic,strong)UIView   *viewRed;

@property(nonatomic,strong)UITextField *textField;

//Test
@property(nonatomic,strong)UIView   *viewLabelContainer;
@property(nonatomic,strong)UILabel  *labelF;
@property(nonatomic,strong)UILabel  *labelS;

@end

@implementation Case1VC

-(void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor grayColor];
    
    _viewYellow = [UIView new];
    _viewYellow.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.viewYellow];
    
    _viewGreen = [UIView new];
    _viewGreen.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.viewGreen];
    
    _viewRed = [UIView new];
    _viewRed.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.viewRed];
    
    _textField = [[UITextField alloc]init];
    [self.view addSubview:_textField];
    _textField.backgroundColor = [UIColor greenColor];
    _textField.placeholder = @"请输入....";

    
//    [self viewSetCenter];
//    [self viewSetUpDown];
//    [self viewLeftAndRight];
//    [self viewUpBigDowmSmall];
//    [self viewXDOnSameLine];
//    [self viewThree];
//    [self viewScrollTest];
//    [self viewKeyBoardShow];
    [self viewLabelTest];
}

- (void)viewLabelTest {
    _viewLabelContainer = [UIView new];
    [self.view addSubview:_viewLabelContainer];
    _viewLabelContainer.backgroundColor = [UIColor yellowColor];
    
    [_viewLabelContainer mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.view);
        make.width.mas_equalTo(self.view).offset(-40);
        make.height.mas_equalTo(40);
        make.left.mas_equalTo(self.view).offset(20);
        make.right.mas_equalTo(self.view).offset(-20);
    }];
    
    _labelF = [UILabel new];
    _labelF.text = @"First";
    _labelF.numberOfLines = 0;
    _labelF.lineBreakMode = NSLineBreakByCharWrapping;
    _labelF.backgroundColor = [UIColor redColor];
    
    _labelS = [UILabel new];
    _labelS.text = @"Second";
    _labelS.numberOfLines = 0;
    _labelS.lineBreakMode = NSLineBreakByCharWrapping;
    _labelS.backgroundColor = [UIColor greenColor];
    
    [_viewLabelContainer addSubview:_labelF];
    [_viewLabelContainer addSubview:_labelS];
    
    [_labelF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(5);
        make.bottom.mas_equalTo(-5);
        make.right.mas_lessThanOrEqualTo(_viewLabelContainer.mas_right);
    }];
    
    [_labelS mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(_labelF);
        make.left.equalTo(_labelF.mas_right);
        make.right.lessThanOrEqualTo(_viewLabelContainer.mas_right);
    }];
    
    
    UIButton *btnAdd = [UIButton buttonWithType:UIButtonTypeCustom];
    btnAdd.tag = 100;
    btnAdd.frame = CGRectMake(100, 100, 50, 30);
    btnAdd.backgroundColor = [UIColor purpleColor];
    [btnAdd addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnAdd];
    
    UIButton *btnMinus = [UIButton buttonWithType:UIButtonTypeCustom];
    btnMinus.tag = 101;
    btnMinus.frame = CGRectMake(230, 100, 50, 30);
    btnMinus.backgroundColor = [UIColor purpleColor];
    [btnMinus addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnMinus];

    
}

- (void)btnClicked:(UIButton *)sender {
    if (sender.tag == 100) {
        _labelF.text = [NSString stringWithFormat:@"%@/First",_labelF.text];
        _labelS.text = [NSString stringWithFormat:@"%@/Second",_labelS.text];
    }
    if (sender.tag == 101) {
        _labelF.text = [NSString stringWithFormat:@"First"];
        _labelS.text = [NSString stringWithFormat:@"Second"];
    }
}




-(void)viewSetCenter {
    __weak typeof (self)weakSelf = self;
    [_viewYellow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(weakSelf.view);
        make.size.mas_equalTo(CGSizeMake(260, 260));
//        make.edges.equalTo(weakSelf.view).with.insets(UIEdgeInsetsMake(10, 10, 10, 10));
    }];
    
    [_viewGreen mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(120, 120));
        make.center.mas_equalTo(_viewYellow.center);
    }];
}

- (void)viewSetUpDown {
    __weak typeof (self)weakSelf = self;
    [_viewYellow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(weakSelf.view);
        make.size.mas_equalTo(CGSizeMake(260, 260));
        //        make.edges.equalTo(weakSelf.view).with.insets(UIEdgeInsetsMake(10, 10, 10, 10));
    }];
    
    [_viewGreen mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(120, 120));
        
        make.top.mas_equalTo(_viewYellow.mas_bottom).with.offset(50);
        make.centerX.mas_equalTo(_viewYellow.mas_centerX);
    }];
}

- (void)viewLeftAndRight {
    [_viewYellow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100, 100));
        make.left.and.top.mas_equalTo(30);
    }];
    
    [_viewGreen mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100, 100));
        make.size.top.mas_equalTo(_viewYellow);
        make.right.mas_equalTo(-30);
    }];
}

//两个上下排列的视图
- (void)viewUpBigDowmSmall {
    __weak typeof (self)weakSelf = self;

    [_viewYellow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(300, 300));
        make.center.mas_equalTo(weakSelf.view);
    }];
    
    [_viewGreen mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(_viewYellow);
        make.top.equalTo(_viewYellow.mas_bottom).offset(20);
        make.size.mas_equalTo(CGSizeMake(100, 300));
        
        make.bottom.mas_equalTo(-20);
    }];
    
}

//两个并列排放的视图 － 相对位置
- (void)viewXDOnSameLine {
    __weak typeof (self)weakSelf = self;
    
    [_viewYellow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(150);
        make.width.mas_equalTo(_viewGreen);
        make.centerY.mas_equalTo(weakSelf.view.mas_centerY);
        
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(_viewGreen.mas_left).offset(-20);
    }];
    
    
    [_viewGreen mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.width.mas_equalTo(_viewYellow);
        make.centerY.mas_equalTo(_viewYellow.mas_centerY);
        
        make.right.mas_equalTo(weakSelf.view).offset(-20);
        make.left.mas_equalTo(_viewYellow.mas_right).offset(20);
    }];
}

//3个view的布局
- (void)viewThree {
    __weak typeof (self)weakSelf = self;

    [_viewGreen mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.right.mas_equalTo(-20);
        make.top.mas_equalTo(20);
        make.left.mas_equalTo(_viewRed.mas_right).offset(20);
    }];
    
    [_viewRed mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(20);
        make.right.mas_equalTo(_viewGreen.mas_left).offset(-20);
        make.bottom.mas_equalTo(_viewYellow.mas_top).offset(-40);
        make.height.mas_equalTo(_viewYellow.mas_height);
        make.width.mas_equalTo(_viewGreen.mas_width);
    }];
    
    [_viewYellow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(20);
        make.bottom.offset(-20);
        make.top.mas_equalTo(_viewRed.mas_bottom).offset(40);
        make.right.mas_equalTo(_viewGreen.mas_left).offset(-20);
        
        make.size.mas_equalTo(_viewRed);
    }];
}

- (void)viewScrollTest {
    UIScrollView *scr = [UIScrollView new];
    scr.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:scr];
    [scr mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).width.insets(UIEdgeInsetsMake(10, 10, 10, 10));
    }];
    
    UIView *container = [UIView new];
    [scr addSubview:container];
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(scr);
        make.width.equalTo(scr);
    }];
    
    int count = 20;
    UIView *lastView = nil;
    
    for (int i = 0; i <= count; i++) {
        UIView *subView = [UIView new];
        [container addSubview:subView];
        subView.backgroundColor = [UIColor colorWithHue:( arc4random() % 256 / 256.0 )saturation:( arc4random() % 128 / 256.0 ) + 0.5 brightness:( arc4random() % 128 / 256.0 ) + 0.5 alpha:1];
        [subView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.right.equalTo(container);
            make.height.mas_equalTo(@(20 * i));
            if (lastView) {
                // lastView存在时 以其底部为下一个view的顶部
                make.top.mas_equalTo(lastView.mas_bottom);
            } else {
                // lastView不存在时 以父视图的顶部为基准
                make.top.mas_equalTo(container.mas_top);
            }
        }];
        lastView = subView;
    }
    
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(lastView.mas_bottom);
    }];
}

//textField的效果
- (void)viewKeyBoardShow {
    __weak typeof (self)weakSelf = self;
    
    [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(200, 35));
        make.bottom.mas_equalTo(weakSelf.view).offset(-40);
        make.centerX.mas_equalTo(weakSelf.view.mas_centerX);
    }];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyBoardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillDisappear:) name:UIKeyboardWillHideNotification object:nil];
}

-(void)keyBoardWillShow:(NSNotification*)noti {
    // 获取键盘基本信息（动画时长与键盘高度）
    NSDictionary *userInfo = [noti userInfo];
    CGRect rect = [userInfo [UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    
    CGFloat keyboardHeight = CGRectGetHeight(rect);
    CGFloat keyboardDuration =
    [userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    // 修改下边距约束
    [_textField mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-keyboardHeight);
    }];
    
    // 更新约束
    [UIView animateWithDuration:keyboardDuration animations:^{
        [self.view layoutIfNeeded];
    }];
    
}

-(void)keyboardWillDisappear:(NSNotification *)noti {
    // 获取键盘基本信息（动画时长与键盘高度）
    NSDictionary *userInfo = [noti userInfo];
    CGRect rect = [userInfo[UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    
    //    CGFloat keyboardHeight = CGRectGetHeight(rect);
    CGFloat keyboardDuration =[userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    [_textField mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-40);
    }];
    [UIView animateWithDuration:keyboardDuration animations:^{
        [self.view layoutIfNeeded];
    }];
}




@end
