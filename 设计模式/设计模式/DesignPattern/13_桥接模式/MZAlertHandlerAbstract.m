//
//  MZAlertHandlerAbstract.m
//  设计模式
//
//  Created by 孟哲 on 2020/2/28.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "MZAlertHandlerAbstract.h"

@implementation MZAlertHandlerAbstract

- (instancetype)init
{
    if ([self isMemberOfClass:[MZAlertHandlerAbstract class]]) {
        NSAssert(![self isMemberOfClass:[MZAlertHandlerAbstract class]], @"MZAlertHandlerAbstract is an abstract class, you should not instantiate it directly.");
        [self doesNotRecognizeSelector:_cmd];
        return nil;
    }else{
        self = [super init];
        if (self) {
            
        }
        return self;
    }
}

- (instancetype)initWithNotification:(MZNotificationAbstract *)notification
{
    return self;
}

- (void)handlerCheck:(MZApiStatInfo *)apiStatInfo
{
     AbstractMethodNotImplemented();
}

@end
