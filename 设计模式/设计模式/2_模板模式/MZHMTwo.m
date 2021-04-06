//
//  MZHMTwo.m
//  设计模式
//
//  Created by 孟哲 on 2020/1/6.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "MZHMTwo.h"

@implementation MZHMTwo

- (void)start {
    MZMLog
}

- (void)engineBoom {
    MZMLog
}

- (void)alarm {
    MZMLog
}

- (void)stop {
    MZMLog
}

- (BOOL)isAlarm {
    return NO;
}

- (void)run {
    MZMLog
    [super run];//子类调用父类模板方法
    MZMLog
}


@end
