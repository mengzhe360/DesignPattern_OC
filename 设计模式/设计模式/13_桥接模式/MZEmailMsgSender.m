//
//  MZEmailMsgSender.m
//  设计模式
//
//  Created by 孟哲 on 2020/2/28.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "MZEmailMsgSender.h"

@interface MZEmailMsgSender ()

@end

@implementation MZEmailMsgSender

- (void)sendMessage:(nonnull NSString *)message {
    
    [self.emails enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *msg = [NSString stringWithFormat:@"向：%@ 发送邮箱📮",obj];
        MZLog(msg);
    }];
    
}

@end
