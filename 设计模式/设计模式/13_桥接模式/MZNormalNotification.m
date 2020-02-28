//
//  MZNormalNotification.m
//  设计模式
//
//  Created by 孟哲 on 2020/2/28.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "MZNormalNotification.h"

@interface MZNormalNotification ()

@end

@implementation MZNormalNotification

- (instancetype)initWithMsgSender:(id<MZMsgSenderProtocol>) msgSender
{
    self = [super initWithMsgSender:msgSender];
    if (self) {
        self.msgSender = msgSender;
    }
    return self;
}

- (void)notify:(NSString *)message level:(MZNotificationEmergencyLevel)level
{
     MZLog(message);
    [self.msgSender sendMessage:message];
}

@end
