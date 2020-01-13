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

- (void)stateHandleA
{
    MZLog(@"必须自己B实现的逻辑");
}

- (void)stateHandleB
{
    MZLog(@"切换状态");
    self.contextState.currentState = _concreteStateA();
    [self.contextState contextStateHandleD:@"切换状态 A 实现"];
}

@end
