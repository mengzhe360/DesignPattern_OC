//
//  MZResponderChainC.m
//  设计模式
//
//  Created by 孟哲 on 2020/1/8.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "MZResponderChainC.h"

@implementation MZResponderChainC

- (HandleLevel)getHandleLevel
{
    return HandleLevelC;
}

- (void)handleResponder:(MZResponderChain *)responder completion:(CompletionBlock)completion
{
    if (completion) {
        NSLog(@"-3-%@:能处理业务逻辑",responder.name);
        completion(YES);
    }
}

@end
