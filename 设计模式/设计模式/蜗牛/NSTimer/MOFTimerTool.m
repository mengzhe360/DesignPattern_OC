//
//  MOFTimerTool.m
//  MOF
//
//  Created by 孟哲 on 2019/6/17.
//  Copyright © 2019 iloc.cc. All rights reserved.
//

#import "MOFTimerTool.h"

typedef void(^MOFTimerBlock) (void);

@interface NSTimer (MOFBlockSupport)

/**
 定时器封装回调（为了避免内存泄漏）
 
 @param interval 间隔时间
 @param repeats 是否重复
 @param block 每一次定时器回调
 @return 定时器
 */
+ (NSTimer *)mof_scheduledTimerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void (^)(void))block;

@end

@implementation NSTimer (MOFBlockSupport)

+ (NSTimer *)mof_scheduledTimerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void (^)(void))block
{
    
    return [self scheduledTimerWithTimeInterval:interval target:self selector:@selector(mof_blockInvoke:) userInfo:[block copy] repeats:repeats];
}

+ (void)mof_blockInvoke:(NSTimer *)timer
{
    void(^block) (void) = timer.userInfo;
    
    if (block) {
        block();
    }
}

@end

@implementation MOFTimerTool

+ (NSTimer *)timerManagerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)yesOrNo withTimerBlock:(void (^)(void))timerBlock
{
    NSTimer *timerManager = [NSTimer mof_scheduledTimerWithTimeInterval:interval repeats:yesOrNo block:^{
        timerBlock();
    }];
    
    return timerManager;
}

@end

