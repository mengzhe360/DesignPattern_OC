//
//  MZMemento.m
//  设计模式
//
//  Created by 孟哲 on 2020/1/14.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "MZMemento.h"

@implementation MZMemento

- (instancetype)initWithStateMap:(NSDictionary *)stateMap
{
    self = [super init];
    if (self) {
        self.stateMap = stateMap;
    }
    return self;
}

- (instancetype)initWithStateMap:(NSDictionary *)stateMap atState:(NSString *)state
{
    self = [super init];
    if (self) {
        NSMutableDictionary *stateMDict = [[NSMutableDictionary alloc] init];
        [stateMDict setObject:stateMap forKey:state];
        self.stateMap = stateMDict.copy;
    }
    return self;
}

@end
