//
//  ScrollerExtendViewController.m
//  SXMScrollExtend
//
//  Created by shengxi on 14/12/25.
//  Copyright (c) 2014年 孙晓萌. All rights reserved.
//

#import "ScrollerExtendViewController.h"
#import "ScrollerView.h"
#import "ScrollerDataSourceObject.h"

//获取屏幕 宽度、高度
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

@interface ScrollerExtendViewController ()<ScrollerViewDelegate>
@property (nonatomic, strong)NSMutableArray *dataMuArray;
@end

@implementation ScrollerExtendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self getDataFromPlist];
    
    //自定义ScrollerView大小
    ScrollerView *scrView = [[ScrollerView alloc] initWithScrollerFrame:CGRectMake(0, 64, SCREEN_WIDTH, 200)];
    //传入数据模型
    scrView.dataSourceArray = self.dataMuArray;
    scrView.delegate = self;
    [self.view addSubview:scrView];
}
/**
 *  懒加载
 */
- (NSMutableArray *)dataMuArray
{
    if (!_dataMuArray) {
        _dataMuArray = [NSMutableArray array];
    }
    return _dataMuArray;
}
/**
 *  获取数据:测试使用
 */
- (void)getDataFromPlist
{
  NSString *pathString = [[NSBundle mainBundle] pathForResource:@"newses" ofType:@"plist"];
    NSArray *array = [NSArray arrayWithContentsOfFile:pathString];
    for (NSDictionary *dic in array) {
        ScrollerDataSourceObject *object = [[ScrollerDataSourceObject alloc] initWithDic:dic];
        [self.dataMuArray addObject:object];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/**
 *  ScrollerView 代理方法
 */
- (void)clickScrollerViewImage:(NSString *)deImageStr
{
    NSLog(@"%@",deImageStr);
}

@end
