//
//  PrivateInterfaceViewController.m
//  FunctionTest
//
//  Created by Chenfy on 16/8/24.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

#import "PrivateInterfaceViewController.h"
#import <objc/runtime.h>

/*
 *屏幕尺寸参数
 */
#define SCREEN_WIDTH        [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT       [UIScreen mainScreen].bounds.size.height

@interface PrivateInterfaceViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)NSMutableArray   *arrayIcons;
@property(nonatomic,strong)NSMutableArray   *arrayNames;


@property(nonatomic,strong)UITableView  *tableView;

@end

@implementation PrivateInterfaceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.arrayIcons = [NSMutableArray array];
    self.arrayNames = [NSMutableArray array];
    
    [self getAppPlist];
    
    [self.view addSubview:self.tableView];
    
    // Do any additional setup after loading the view, typically from a nib.
}

/** 获取设备安装应用的App列表 */
-(void)getAppPlist {
    Class LSApplicationWorkspace_class = objc_getClass("LSApplicationWorkspace");
    NSObject* workspace = [LSApplicationWorkspace_class performSelector:@selector(defaultWorkspace)];
    NSArray*apps = [workspace performSelector:@selector(allApplications)];
    NSMutableArray*appsIconArr = [NSMutableArray array];
    NSMutableArray*appsNameArr = [NSMutableArray array];
    NSLog(@"apps: %@",apps );
    
    [apps enumerateObjectsUsingBlock:^(id obj,NSUInteger idx,BOOL* stop) {
        
        NSDictionary*boundIconsDictionary = [obj performSelector:@selector(boundIconsDictionary)];
        
        NSString*iconPath = [NSString stringWithFormat:@"%@/%@.png", [[obj performSelector:@selector(resourcesDirectoryURL)]path], [[[boundIconsDictionary objectForKey:@"CFBundlePrimaryIcon"]objectForKey:@"CFBundleIconFiles"]lastObject]];
        UIImage*image = [[UIImage alloc]initWithContentsOfFile:iconPath];
        id name = [obj performSelector:@selector(localizedName)];
        if(image) {
            [appsIconArr addObject:image];
            [self.arrayIcons addObject:image];
            
            [appsNameArr addObject: name];
            [self.arrayNames addObject:name];
        } else {
            UIImage *imagedd = [UIImage imageNamed:@"iconm.png"];
            [appsIconArr addObject:imagedd];
            [self.arrayIcons addObject:imagedd];
            
            [appsNameArr addObject: name];
            [self.arrayNames addObject:name];
        }
        NSLog(@"iconPath = %@", iconPath);
        NSLog(@"name = %@", name);
        NSLog(@"%@",[self properties_aps:obj]);
        NSLog(@"_____________________________________________\n");
    }];
}

- (NSDictionary *)properties_aps:(id)objc {
    NSMutableDictionary *props = [NSMutableDictionary dictionary];
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList([objc class], &outCount);
    for (i = 0; i<outCount; i++) {
        objc_property_t property = properties[i];
        const char* char_f =property_getName(property);
        NSString *propertyName = [NSString stringWithUTF8String:char_f];
        id propertyValue = [objc valueForKey:(NSString *)propertyName];
        if (propertyValue) [props setObject:propertyValue forKey:propertyName];
        
    }
    free(properties);
    return props;
}

//++++++++++++++++++++++++++++++++++++++++
/** 暴力打开某个APP iOS 私有API LSApplicationWorkspace */
+ (BOOL)isOpenApp:(NSString*)appIdentifierName {
    Class LSApplicationWorkspace_class = objc_getClass("LSApplicationWorkspace");
    NSObject* workspace = [LSApplicationWorkspace_class performSelector:@selector(defaultWorkspace)];
    BOOL isOpenApp = [workspace performSelector:@selector(openApplicationWithBundleID:) withObject:appIdentifierName];
    
    return isOpenApp;
}


-(UITableView *)tableView {
    if (!_tableView) {
        int space = 20;
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(space, space, SCREEN_WIDTH - space * 2, SCREEN_HEIGHT - space * 2) style:UITableViewStylePlain];
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
    return self.arrayNames.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identify = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identify];
    }
    cell.imageView.image = self.arrayIcons[indexPath.row];
    cell.textLabel.text = self.arrayNames[indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}



@end
