//
//  MZHMTwo.m
//  设计模式
//
//  Created by 孟哲 on 2020/1/6.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "MZHMTwo.h"
#import "MZHMProtocol.h"

@implementation MZHMTwo

- (void)start {
    NSLog(@"MZHMTwo-start\n");
}

- (void)engineBoom {
    NSLog(@"MZHMTwo-engineBoom\n");
}


- (void)alarm {
    NSLog(@"MZHMTwo-alarm\n");
}

- (void)stop {
    NSLog(@"MZHMTwo-stop\n\n");
    NSLog(@"\n");
}

- (BOOL)isAlarm {
    return true;
}

- (void)run {
    [super run];
     NSLog(@"MZHMTwo-run\n\n");
}


@end
