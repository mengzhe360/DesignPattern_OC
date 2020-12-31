//
//  MZReusePoolViewController.m
//  设计模式
//
//  Created by 孟哲 on 2020/2/27.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "MZReusePoolViewController.h"
#import "MZTableViewIndex.h"

@interface MZReusePoolViewController ()<UITableViewDataSource,UITableViewDelegate,MZTableViewIndexDelegate>
{
    MZTableViewIndex *tableView;
    UIButton *button;
    NSMutableArray *dataSource;
}

@end

@implementation MZReusePoolViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:@"reloadTable" style:UIBarButtonItemStylePlain
                    target:self action:@selector(doAction:)];
    self.navigationItem.rightBarButtonItem = anotherButton;
    
    //创建一个Tableview
    tableView = [[MZTableViewIndex alloc] initWithFrame:CGRectMake(0, 60, self.view.frame.size.width, self.view.frame.size.height - 60) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    
    // 设置table的索引数据源
    tableView.indexedDataSource = self;
    
    [self.view addSubview:tableView];

    // 数据源
    dataSource = [NSMutableArray array];
    for (int i = 0; i < 1000; i++) {
        [dataSource addObject:@(i+1)];
    }
    
}

#pragma mark IndexedTableViewDataSource

- (NSArray <NSString *> *)indexTitlesForIndexTableView:(UITableView *)tableView{
    
    //奇数次调用返回6个字母，偶数次调用返回11个
    static BOOL change = NO;
    
    if (change) {
        change = NO;
        return @[@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"A1",@"B1",@"C1",@"D1",@"E1",@"F1",@"G1",@"H1",@"I1",@"J1",@"K1"];
    } else{
        change = YES;
        return @[@"A",@"B",@"C",@"D",@"E",@"F"];
    }
    
}

- (void)scrollToRowAtIndexPathOfIndex:(NSInteger)index
{
    [tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:index*3 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];
}

#pragma mark UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [dataSource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"reuseId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = [[dataSource objectAtIndex:indexPath.row] stringValue];
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

- (void)doAction:(id)sender{
    
    [tableView reloadData];
}



@end
