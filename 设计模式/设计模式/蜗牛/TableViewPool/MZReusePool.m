//
//  MZReusePool.m
//  设计模式
//
//  Created by 孟哲 on 2020/2/27.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "MZReusePool.h"

@interface MZReusePool ()

// 等待使用的队列
@property (nonatomic, strong) NSMutableSet *waitUsedQueue;
// 使用中的队列
@property (nonatomic, strong) NSMutableSet *usingQueue;

@end

@implementation MZReusePool

- (id)init{
    self = [super init];
    if (self) {
        _waitUsedQueue = [NSMutableSet set];
        _usingQueue = [NSMutableSet set];
    }
    return self;
}

- (UIView *)dequeueReusableView
{
    UIView *view = [_waitUsedQueue anyObject];
    
    if (view == nil) {
        return nil;
    } else{
        // 进行队列移动
        [_waitUsedQueue removeObject:view];
        [_usingQueue addObject:view];
        return view;
    }
}

- (void)addUsingView:(UIView *)view
{
    if (view == nil) {
        return;
    }
    
    // 添加视图到使用中的队列
    [_usingQueue addObject:view];
}

- (void)reset
{
    UIView *view = nil;
    while ((view = [_usingQueue anyObject])) {
        // 从使用中队列移除
        [_usingQueue removeObject:view];
        // 加入等待使用的队列
        [_waitUsedQueue addObject:view];
    }
}


@end
