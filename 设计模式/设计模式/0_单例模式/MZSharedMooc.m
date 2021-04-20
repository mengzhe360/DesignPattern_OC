//
//  MZSharedMooc.m
//  设计模式
//
//  Created by A5 on 2021/4/20.
//  Copyright © 2021 孟哲. All rights reserved.
//

#import "MZSharedMooc.h"

@implementation MZSharedMooc

+ (id)sharedInstance
{
    // 静态局部变量
    static MZSharedMooc *instance = nil;
    
    // 通过dispatch_once方式 确保instance在多线程环境下只被创建一次
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // 创建实例
        instance = [[super allocWithZone:NULL] init];
    });
    return instance;
}

// 重写方法【必不可少】
+ (id)allocWithZone:(struct _NSZone *)zone{
    return [self sharedInstance];
}

// 重写方法【必不可少】
- (id)copyWithZone:(nullable NSZone *)zone{
    return self;
}

@end
