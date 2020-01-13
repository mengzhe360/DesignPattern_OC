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

- (void)stateHandleA
{
    MZLog(@"切换状态");
    self.contextState.currentState = _concreteStateB;
    [self.contextState contextStateHandleC:@"切换状态 B 实现"];
}

- (void)stateHandleB
{
    MZLog(@"必须自己A实现的逻辑");
}

@end
