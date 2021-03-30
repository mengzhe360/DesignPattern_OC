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
    MZTimerProxy *proxy = [MZTimerProxy alloc];
    proxy.target = target;
    return proxy;
}

//注意指派其他对象的方法来完成 NSProxy没有下面这个方法
//- (id)forwardingTargetForSelector:(SEL)aSelector
//{
//    if (aSelector == @selector(test)) {
//        return nil;
//    }
//    return [super forwardingTargetForSelector:aSelector];
//}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel
{
    return [self.target methodSignatureForSelector:sel];
}

- (void)forwardInvocation:(NSInvocation *)invocation
{
    [invocation invokeWithTarget:self.target];
}

@end
