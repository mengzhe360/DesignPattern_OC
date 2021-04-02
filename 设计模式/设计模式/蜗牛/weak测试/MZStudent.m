//
//  MZStudent.m
//  设计模式
//
//  Created by A5 on 2020/9/9.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "MZStudent.h"

@implementation MZStudent

- (instancetype)init
{
    if (self = [super init]) {
  
    }
    return self;
}

- (void)textMethod
{
    MZMLog
    if (self.block) {
        self.block();
    }
    
    MZLog(self)//EXC_BAD_ACCESS 访问了一个已经被释放的内存区域
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
//        // 注意第一个参数一定要是元类object_getClass(self)
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
//如果不为空会调用forwardInvocation:方法
//- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel
//{
//    return [self.target methodSignatureForSelector:sel];
//}
//
//- (void)forwardInvocation:(NSInvocation *)invocation
//{
//    [invocation invokeWithTarget:self.target];
//}

- (void)dealloc
{
    MZMLog
}

@end
