//
//  Level_mainViewController.m
//  Demo_MJRefresh
//
//  Created by goulela on 16/12/23.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "Level_mainViewController.h"

#import "Masonry.h"

#import "Level_oneViewController.h"
#import "Level_twoViewController.h"
#import "Level_threeViewController.h"
#import "Level_fourViewController.h"
#import "Level_fiveViewController.h"
#import "Level_sixViewController.h"
#import "Level_sevenViewController.h"


@interface Level_mainViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) NSMutableArray * dataArrayM;

@end

@implementation Level_mainViewController

#pragma mark - 生命周期
#pragma mark viewDidLoad
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self basicSetting];
    
    [self addTableView];
    
    [self createData];
}


#pragma mark - 系统代理

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArrayM.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * idetifier = @"cell";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:idetifier];
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idetifier];
    }
    
    cell.textLabel.text = self.dataArrayM[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        Level_oneViewController * one = [[Level_oneViewController alloc] init];
        [self.navigationController pushViewController:one animated:YES];
    } else if (indexPath.row == 1) {
        Level_twoViewController * two = [[Level_twoViewController alloc] init];
        [self.navigationController pushViewController:two animated:YES];
    } else if (indexPath.row == 2) {
        Level_threeViewController * three = [[Level_threeViewController alloc] init];
        [self.navigationController pushViewController:three animated:YES];
    } else if (indexPath.row == 3) {
        Level_fourViewController * four = [[Level_fourViewController alloc] init];
        [self.navigationController pushViewController:four animated:YES];
    } else if (indexPath.row == 4) {
        Level_fiveViewController * five = [[Level_fiveViewController alloc] init];
        [self.navigationController pushViewController:five animated:YES];
    } else if (indexPath.row == 5) {
        Level_sixViewController * six = [[Level_sixViewController alloc] init];
        [self.navigationController pushViewController:six animated:YES];
    } else if (indexPath.row == 6) {
        Level_sevenViewController * seven = [[Level_sevenViewController alloc] init];
        [self.navigationController pushViewController:seven animated:YES];
    }
}

#pragma mark - 点击事件

#pragma mark - 实现方法
#pragma mark 基本设置
- (void)basicSetting
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"各种使用";
    
}

- (void)addTableView
{
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(self.view).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}

- (void)createData
{
    NSArray * array = @[@"默认的刷新加载",@"动画图片",@"隐藏时间和状态",@"自定义文字",@"全部加载完毕",@"自定义头部刷新控件",@"6",@"7",@"8",@"9"];
    
    self.dataArrayM = [NSMutableArray arrayWithArray:array];
    
    [self.tableView reloadData];
}

#pragma mark - setter & getter

- (UITableView *)tableView
{
    if (!_tableView)
    {
        self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
        
    }
    return _tableView;
}

- (NSMutableArray *)dataArrayM
{
    if (!_dataArrayM)
    {
        self.dataArrayM = [NSMutableArray arrayWithCapacity:0];
    }
    return _dataArrayM;
}

@end

