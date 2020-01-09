//
//  MZCViewController.m
//  设计模式
//
//  Created by A5 on 2020/1/8.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "MZCViewController.h"

@interface MZCViewController ()

@end

@implementation MZCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.orangeColor;
    self.navigationItem.title = @"MZC";
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    void(^MZBlock1)(NSString *) = ^(NSString *mz) {
        NSLog(@"mz:%@",mz);
    };

    [self performClassName:@"MZAViewController" selector:@"mztest:callBlock:" withObjects:@[@"perform测试",MZBlock1] type:kClassMethod];
}

@end
