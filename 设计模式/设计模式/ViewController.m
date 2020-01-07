//
//  ViewController.m
//  设计模式
//
//  Created by 孟哲 on 2020/1/6.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "ViewController.h"
#import "MZHMOne.h"
#import "MZHMTwo.h"
#import "MZDynamicProxy.h"
#import "MZNormalObject.h"
#import "MZNormalTest.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    [self dynamicProtocol];
    
}


/// 2、模板模式
- (void)templateMode
{
    MZHMOne *one = [MZHMOne new];
    [one setAlarm:true];
    [one run];
    
    MZHMTwo *two = [MZHMTwo new];
    [two run];
}


/// 3、动态代理
- (void)dynamicProtocol
{
    Class class = NSClassFromString(@"MZNormalTest");
    id vc = [[class alloc] init];
    id<MZDynamicProtocol> obj = (id)[[MZDynamicProxy alloc] initWithObject:vc];
    
//        id<MZDynamicProtocol> obj = (id)[[MZNormalObject alloc] init];
//        id<MZDynamicProtocol> obj = (id)[[MZDynamicProxy alloc] initWithObject:(id)[[MZNormalObject alloc] init]];

    [obj doSomething];
    [obj doOtherThing];
    [obj optionalThing];
    [(MZNormalTest *)vc mzOptionalThing];
}

@end
