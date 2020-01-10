//
//  NSObject+MZPerformSelector.m
//  设计模式
//
//  Created by A5 on 2020/1/9.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "NSObject+MZPerformSelector.h"

@implementation NSObject (MZPerformSelector)

- (id)performClass:(id)class selector:(NSString *)SELStr objects:(NSArray <id> *)objects type:(RequestMethodType)type
{
    return [self performTarget:class selector:SELStr objects:objects type:type singletonType:YES];
}

- (id)performClassName:(NSString *)className selector:(NSString *)SELStr objects:(NSArray <id> *)objects type:(RequestMethodType)type
{
    Class aClass = NSClassFromString(className);
    
    return [self performTarget:aClass selector:SELStr objects:objects type:type singletonType:NO];
}

- (id)performTarget:(Class)aClass selector:(NSString *)aSEL objects:(NSArray <id> *)objects type:(RequestMethodType)type singletonType:(BOOL)isYes
{
    
    SEL aSelector = NSSelectorFromString(aSEL);
    
    NSMethodSignature *signature = nil;
    if (type == kInstanceMethod) {
        signature = [[aClass class] instanceMethodSignatureForSelector:aSelector];
    }else if (type == kClassMethod){
        signature = [[aClass class] methodSignatureForSelector:aSelector];
    }
    
    if (!signature) {
        NSString *info = [NSString stringWithFormat:@"-[%@ %@]:unrecognized selector sent to instance",[aClass class],NSStringFromSelector(aSelector)];
        @throw [[NSException alloc] initWithName:@"MZ崩溃错误提示:" reason:info userInfo:nil];
        return nil;
    }
    
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    
    id target = nil;
    if (isYes) {
        target = aClass;
    }else{
        if (type == kInstanceMethod) {
            target = [[aClass alloc] init];
        }else if (type == kClassMethod){
            target = aClass;
        }
    }
    invocation.target = target;
    invocation.selector = aSelector;
    
    NSInteger arguments = signature.numberOfArguments - 2;
    
    NSUInteger objectsCount = objects.count;
    NSInteger count = MIN(arguments, objectsCount);
    for (int i = 0; i < count; i++) {
        id obj = objects[i];
        if ([obj isKindOfClass:[NSNull class]]) {obj = nil;}
        [invocation setArgument:&obj atIndex:i+2];
    }
    
    [invocation invoke];
    
    id res = nil;
    if (signature.methodReturnLength != 0) {
        [invocation getReturnValue:&res];
    }
    return res;
}

+ (id)objectForClassName:(NSString *)className{
    Class aClass = NSClassFromString(className);
    return [[aClass alloc] init];
}

@end
