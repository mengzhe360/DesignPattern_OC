//
//  MZContextState.m
//  设计模式
//
//  Created by A5 on 2020/1/13.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "MZContextState.h"
#import "MZConcreteStateA.h"
#import "MZConcreteStateB.h"

id _concreteStateA(){
    return [MZConcreteStateA sharedInstance];
}

id _concreteStateB(){
    return [MZConcreteStateB sharedInstance];
}

static id _concreteStateAa = nil;
static id _concreteStateBb = nil;

@interface MZContextState ()

@end

@implementation MZContextState

+ (void)initialize
{
    if (self == [MZContextState class]) {
        _concreteStateAa = [[MZConcreteStateA alloc] init];
        _concreteStateBb = [[MZConcreteStateB alloc] init];
    }
}

- (void)setCurrentState:(MZAbstractState *)currentState
{
    _currentState = currentState;
    _currentState.contextState = self;//关键内部切换状态
}

- (void)contextStateHandleC:(NSString *)state
{
    MZLog(state)
    [self.currentState stateHandleA];
}

- (void)contextStateHandleD:(NSString *)state
{
    MZLog(state)
    [self.currentState stateHandleB];
}

@end
