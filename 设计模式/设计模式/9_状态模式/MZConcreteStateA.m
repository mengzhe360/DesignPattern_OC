//
//  MZConcreteStateA.m
//  设计模式
//
//  Created by A5 on 2020/1/13.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "MZConcreteStateA.h"
#import "MZContextState.h"

@implementation MZConcreteStateA

+ (instancetype)sharedInstance
{
    static id _sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] init];
    });
    return _sharedInstance;
}

- (void)stateHandleA
{
    MZLog(@"开始切换状态");
    self.contextState.currentState = _concreteStateB();
    [self.contextState contextStateHandleC:@"切换到 B 状态实去现"];
}

- (void)stateHandleB
{
    MZLog(@"必须自己A实现的逻辑");
}

@end
