
//
//  MZHMManager.m
//  设计模式
//
//  Created by 孟哲 on 2020/1/6.
//  Copyright © 2020 孟哲. All rights reserved.
//

/*
 模板模式主要是用来解决 复用和扩展
 复用：把一个算法中不变的流程抽象到父类的模板方法 （例如：[super run]，子类调用父类方法）
 扩展：框架通过模板模式提供功能扩展点，让框架用户可以在不修改框架源码的情况下，基于扩展点定制化框架的功能（子类复写父类方法）
 模板方法模式在一个方法中定义一个算法骨架，并将某些步骤推迟到子类中实现。模板方法模式可以让子类在不改变算法整体结构的情况下，重新定义算法中的某些步骤
 */
#import "MZHMManager.h"

@implementation MZHMManager

- (void)start {
    AbstractMethodNotImplemented();
}

- (void)engineBoom {
    AbstractMethodNotImplemented();
}

- (void)alarm {
    AbstractMethodNotImplemented();
}

- (void)stop {
    AbstractMethodNotImplemented();
}

//核心父类调用子类方法
- (void)run
{
    [self start];
    [self engineBoom];
    
    if ([self isAlarm]) {
        [self alarm];
    }
    
    [self stop];
}

- (BOOL)isAlarm {
    return true;
}

@end
