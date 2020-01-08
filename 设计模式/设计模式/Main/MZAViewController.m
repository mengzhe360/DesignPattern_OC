//
//  MZAViewController.m
//  设计模式
//
//  Created by A5 on 2020/1/8.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "MZAViewController.h"
#import "MZStrategyViewController.h"

@interface MZAViewController ()

@end

@implementation MZAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.greenColor;
    self.navigationItem.title = @"MZA";
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self strategyMode];
}

/// 4_策略模式
- (void)strategyMode
{
    MZStrategyViewController *VC = [[MZStrategyViewController alloc] init];
    struct mj_objc_class *cls = (__bridge struct mj_objc_class *)[MZStrategyViewController class];
//    [self.navigationController pushViewController:VC animated:YES];
}


@end
