//
//  MZInvoker.m
//  设计模式
//
//  Created by A5 on 2020/5/14.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "MZInvoker.h"
#import "MZBaseCommand.h"

@implementation MZInvoker

+ (instancetype)sharedInstance
{
    static MZInvoker *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[super allocWithZone:NULL] init];
    });
    return instance;
}

+ (id)allocWithZone:(struct _NSZone *)zone{
    return [self sharedInstance];
}

- (id)copyWithZone:(nullable NSZone *)zone{
    return self;
}

- (id)init
{
    self = [super init];
    if (self) {
        _arrayCommands = [NSMutableArray array];
    }
    return self;
}

+ (void)executeCommand:(MZBaseCommand *)cmd completion:(CommandCompletionCallBack)completion
{
    if (cmd) {
        // 如果命令正在执行不做处理，否则添加并执行命令
        if (![self isExecutingCommand:cmd]) {
            
            [MZInvoker.sharedInstance.arrayCommands addObject:cmd];
            // 设置命令执行完成的回调
            cmd.completion = completion;
            //执行命令
            [cmd execute];
        }
    }
}

// 取消命令
+ (void)cancelCommand:(MZBaseCommand *)cmd
{
    if (cmd) {
        [MZInvoker.sharedInstance.arrayCommands removeObject:cmd];
        [cmd cancel];
    }
}

// 判断当前命令是否正在执行
+ (BOOL)isExecutingCommand:(MZBaseCommand *)cmd
{
    if (cmd) {
        NSArray *cmds = MZInvoker.sharedInstance.arrayCommands;
        for (MZBaseCommand *aCmd in cmds) {
            // 当前命令正在执行
            if (cmd == aCmd) {
                return YES;
            }
        }
    }
    return NO;
}

@end
