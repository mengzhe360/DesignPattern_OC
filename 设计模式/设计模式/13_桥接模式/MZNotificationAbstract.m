//
//  MZNotificationAbstract.m
//  设计模式
//
//  Created by 孟哲 on 2020/2/28.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "MZNotificationAbstract.h"

@interface MZNotificationAbstract ()

@end

@implementation MZNotificationAbstract

- (instancetype)init
{
    if ([self isMemberOfClass:[MZNotificationAbstract class]]) {
        NSAssert(![self isMemberOfClass:[MZNotificationAbstract class]], @"MZNotificationAbstract is an abstract class, you should not instantiate it directly.");
        [self doesNotRecognizeSelector:_cmd];
        return nil;
    }else{
        self = [super init];
        if (self) {
            
        }
        return self;
    }
}

- (instancetype)initWithMsgSender:(id<MZMsgSenderProtocol>) msgSender
{
    return self;
}

- (void)notify:(NSString *)message level:(MZNotificationEmergencyLevel)level
{
    AbstractMethodNotImplemented();
}

@end
