
//
//  MZHMManager.m
//  设计模式
//
//  Created by 孟哲 on 2020/1/6.
//  Copyright © 2020 孟哲. All rights reserved.
//

/*
 
 
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
