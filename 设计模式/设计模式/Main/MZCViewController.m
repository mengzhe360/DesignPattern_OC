//
//  MZCViewController.m
//  设计模式
//
//  Created by A5 on 2020/1/8.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "MZCViewController.h"
#import "MZSubscriptionServiceCenterProtocol.h"

@interface MZCViewController ()<MZSubscriptionServiceCenterProtocol>

@end

@implementation MZCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.orangeColor;
    self.navigationItem.title = @"MZC";
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
}

- (void)subscriptionMessage:(id)message subscriptionNumber:(NSString *)subscriptionNumber
{
    if ([subscriptionNumber isEqualToString:@"NEWTON"]) {

        NSLog(@"MCViewController-来自于牛顿杂志的信息 - %@", message);

    } else if ([subscriptionNumber isEqualToString:@"SCIENCE"]) {

        NSLog(@"MCViewController-来自于科学美国人杂志的信息 - %@", message);
    }
}


@end
