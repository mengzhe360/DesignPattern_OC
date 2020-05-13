//
//  MZConcreteStateB.m
//  设计模式
//
//  Created by A5 on 2020/1/13.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "MZConcreteStateB.h"
#import "MZContextState.h"

@implementation MZConcreteStateB

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
//    MZLog(@"必须自己B实现的逻辑");
    MZMLog;
}

- (void)stateHandleB
{
//    [self.contextState contextStateHandleD:@"开始切换到 A 状态去实现"];
    MZMLog;
}

@end
