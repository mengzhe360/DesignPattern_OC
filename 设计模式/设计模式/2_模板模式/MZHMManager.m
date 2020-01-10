
//
//  MZHMManager.m
//  设计模式
//
//  Created by 孟哲 on 2020/1/6.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "MZHMManager.h"

@implementation MZHMManager

- (void)start {

}

- (void)engineBoom {

}

- (void)alarm {

}

- (void)stop {

}

- (void)run
{
    [self  start];
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
