//
//  MZFlyweightFactory.m
//  设计模式
//
//  Created by A5 on 2020/1/17.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "MZFlyweightFactory.h"
#import "MZConcreteFlyweight.h"
#import "MZUnConcreteFlyweight.h"

static  NSMapTable  *_flyweightPool = nil;

@implementation MZFlyweightFactory

+ (void)initialize
{
    if (self == [MZFlyweightFactory class]) {
        _flyweightPool = [NSMapTable weakToStrongObjectsMapTable];
    }
}

//核心创建共享池
- (MZConcreteFlyweight *)getFlyweight:(NSString *)extrinsic
{
    MZConcreteFlyweight *flyweight = nil;
    
    if([_flyweightPool objectForKey:extrinsic]) {
        flyweight = [_flyweightPool objectForKey:extrinsic];
        NSString *key = [NSString stringWithFormat:@"池中已经创建该对象:%@",extrinsic];
        MZLog(key);
    } else {
        flyweight = [[MZConcreteFlyweight alloc] init];
        [_flyweightPool setObject:flyweight forKey:extrinsic];
        NSString *key = [NSString stringWithFormat:@"创建该对象:%@-并取出",extrinsic];
        MZLog(key);
    }
    
    return flyweight;
}

- (NSInteger)getFlyweightCount
{
    NSString *count = [NSString stringWithFormat:@"共享池一共创建了 %lu 个对象",(unsigned long)_flyweightPool.count];
    MZLog(count)
    return _flyweightPool.count;
}

@end
