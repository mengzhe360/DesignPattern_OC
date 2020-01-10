//
//  MZResponderChainA.m
//  设计模式
//
//  Created by 孟哲 on 2020/1/8.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "MZResponderChainA.h"

@implementation MZResponderChainA

- (HandleLevel)getHandleLevel
{
    return HandleLevelA;
}

- (void)handleResponder:(MZResponderChain *)responder completion:(CompletionBlock)completion
{
    if (completion) {
        NSLog(@"-3-%@:不能处理业务逻辑",responder.name);
        completion(NO);
    }
}

@end
