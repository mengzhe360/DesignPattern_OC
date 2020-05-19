//
//  MZDynamicProxy.m
//  设计模式
//
//  Created by 孟哲 on 2020/1/7.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "MZDynamicProxy.h"
#import "MZAbstarctManager.h"
#import <objc/message.h>

@interface MZDynamicProxy()

@property (nonatomic,strong) id<MZDynamicProtocol> target;

@end

@implementation MZDynamicProxy

- (id)initWithObject:(id)obj {
    _target = (id<MZDynamicProtocol>)obj;
    return self;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    if ([_target respondsToSelector:sel]) {
        return [(NSObject *)_target methodSignatureForSelector:sel];
    }
    
    MZAbstarctManager *message = [MZAbstarctManager sharedInstance];
    return [message methodSignatureForSelector:NSSelectorFromString(@"emptySpamMessages:withString:")];

//    return [super methodSignatureForSelector:sel];
}

- (void)forwardInvocation:(NSInvocation *)invocation {
    
    if ([_target respondsToSelector:invocation.selector]) {
        
        NSLog(@"proxy invocation obj method : %@", NSStringFromSelector(invocation.selector));
        [invocation invokeWithTarget:self.target];
        
    }else{
        
         //  获取参数
        NSString *selectorString = NSStringFromSelector(invocation.selector);
        // 1.替换
        invocation.selector = NSSelectorFromString(@"emptySpamMessages:withString:");
        // 2.再次回去单例对象
        MZAbstarctManager *message = [MZAbstarctManager sharedInstance];
        // 3. 设置代理. 代理就是专门处理垃圾数据的一个对象
        [invocation setTarget:message];
        
        // 获取当前控制器的类(ContentProxy)
        const char *className = class_getName([self class]);
        NSArray *parmater = nil;
        NSString *str = @"自定义处理找不到的方法";
        
        // 判断代理
        if (_target) {
            parmater = @[[NSString stringWithUTF8String:className],NSStringFromClass(_target.class), selectorString];
        } else {
            parmater = @[[NSString stringWithUTF8String:className], selectorString];
        }
        // 因为0 1 被两个隐式参数占用self,_cmd. 分别表示的是target和selector
        [invocation setArgument:&parmater atIndex:2];
        [invocation setArgument:&str atIndex:3];
        // 执行方法,派发消息
        [invocation invoke];
    }
   
}

- (void)doSomething {
    MZLog(@"动态代理")
    [_target doSomething];
}

- (void)doOtherThing{
    MZLog(@"动态代理")
    [_target doOtherThing];
}

@end
