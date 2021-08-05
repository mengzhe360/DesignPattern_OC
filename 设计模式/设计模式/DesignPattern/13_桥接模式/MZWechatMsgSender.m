//
//  MZWechatMsgSender.m
//  设计模式
//
//  Created by 孟哲 on 2020/2/28.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "MZWechatMsgSender.h"

@interface MZWechatMsgSender ()


@end

@implementation MZWechatMsgSender

- (void)sendMessage:(nonnull NSString *)message {
    
    [self.wechats enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *msg = [NSString stringWithFormat:@"向：%@ 发送微信🇨🇦",obj];
        MZLog(msg);
    }];
    
}

@end
