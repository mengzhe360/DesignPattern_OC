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
//    [self.contextState contextStateHandleC:@"开始切换到 B 状态实去现"];
    MZMLog;
}

- (void)stateHandleB
{
//    MZLog(@"必须自己A实现的逻辑");
    MZMLog;
}

@end
