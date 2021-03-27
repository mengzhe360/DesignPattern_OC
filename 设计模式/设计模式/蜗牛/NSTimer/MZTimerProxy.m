//
//  MZTimerProxy.m
//  设计模式
//
//  Created by 孟哲 on 2021/3/27.
//  Copyright © 2021 孟哲. All rights reserved.
//

#import "MZTimerProxy.h"

@implementation MZTimerProxy

+ (instancetype)proxyWithTarget:(id)target
{
    // NSProxy对象不需要调用init，因为它本来就没有init方法
    MJProxy *proxy = [MJProxy alloc];
    proxy.target = target;
    return proxy;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel
{
    return [self.target methodSignatureForSelector:sel];
}

- (void)forwardInvocation:(NSInvocation *)invocation
{
    [invocation invokeWithTarget:self.target];
}

@end
