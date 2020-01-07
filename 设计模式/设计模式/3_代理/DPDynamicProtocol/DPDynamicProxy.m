//
//  DPDynamicProxy.m
//  单例释放
//
//  Created by A5 on 2020/1/2.
//  Copyright © 2020 mengzhe. All rights reserved.
//

#import "DPDynamicProxy.h"
#import "DPDynamicProtocol.h"

@implementation DPDynamicProxy

- (id)initWithObject:(id)obj {
    _target = (id<DPDynamicProtocol>)obj;
    return self;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    if ([_target isKindOfClass:[NSObject class]]) {
        return [(NSObject *)_target methodSignatureForSelector:sel];
    }
    return [super methodSignatureForSelector:sel];
}

- (void)forwardInvocation:(NSInvocation *)invocation {
    
    if ([_target respondsToSelector:invocation.selector]) {
        NSLog(@"proxy invocation obj method : %@", NSStringFromSelector(invocation.selector));
        [invocation invokeWithTarget:self.target];
    }else{
        [super forwardInvocation:invocation];
    }
   
}

- (void)doSomething {
    NSLog(@"proxy do something");
    [_target doSomething];
}

- (void)doOtherThing{
    NSLog(@"proxy do doOtherThing");
    [_target doOtherThing];
}

@end
