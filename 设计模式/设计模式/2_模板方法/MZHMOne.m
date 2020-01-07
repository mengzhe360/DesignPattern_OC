//
//  MZHMOne.m
//  设计模式
//
//  Created by 孟哲 on 2020/1/6.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "MZHMOne.h"


@implementation MZHMOne

- (void)start {
    NSLog(@"MZHMOne-start\n");
}

- (void)engineBoom {
    NSLog(@"MZHMOne-engineBoom\n");
}

- (void)alarm {
    NSLog(@"MZHMOne-alarm\n");
}

- (void)stop {
    NSLog(@"MZHMOne-stop\n\n");
    NSLog(@"\n");
}

- (BOOL)isAlarm {
    return self.alarmFlag;
}

- (void)setAlarm:(BOOL)isAlarm {
    self.alarmFlag = isAlarm;
}



@end
