//
//  MZTpsAlertHandler.m
//  设计模式
//
//  Created by 孟哲 on 2020/2/28.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "MZTpsAlertHandler.h"
#import "MZApiStatInfo.h"

@implementation MZTpsAlertHandler

- (instancetype)initWithNotification:(MZNotificationAbstract *)notification
{
    self = [super initWithNotification:notification];
    if (self) {
        self.notification = notification;
    }
    return self;
}

- (void)handlerCheck:(MZApiStatInfo *)apiStatInfo
{
    long tps = apiStatInfo.requestCount/apiStatInfo.durationSeconds;
    if (tps > 10) { }
    MZLog(apiStatInfo);
    [self.notification notify:@"正确" level:SEVERE];
}

@end
