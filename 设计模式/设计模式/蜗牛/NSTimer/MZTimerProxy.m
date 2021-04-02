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
    // NSProxy是直接用来进行消息转发的 NSProxy对象不需要调用init，因为它本来就没有init方法
    MZTimerProxy *proxy = [MZTimerProxy alloc];
    proxy.target = target;
    return proxy;
}

//动态添加对象方法，需要给类添加方法
//+ (BOOL)resolveInstanceMethod:(SEL)sel{
//    if (sel == @selector(test)) {
//        Method method = class_getInstanceMethod(self, @selector(other));
//        class_addMethod(self, sel, method_getImplementation(method), method_getTypeEncoding(method));
//        return YES;
//    }
//    return [super resolveInstanceMethod:sel];
//}

//动态添加类方法 需要传入元类
//+ (BOOL)resolveClassMethod:(SEL)sel
//{
//    if (sel == @selector(test)) {
//        // 第一个参数是object_getClass(self)
//        class_addMethod(object_getClass(self), sel, (IMP)c_other, "v16@0:8");
//        return YES;
//    }
//    return [super resolveClassMethod:sel];
//}

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
