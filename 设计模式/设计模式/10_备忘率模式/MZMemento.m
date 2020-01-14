//
//  MZMemento.m
//  设计模式
//
//  Created by 孟哲 on 2020/1/14.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "MZMemento.h"

@implementation MZMemento

- (instancetype)initWithState:(NSString *)state
{
    self = [super init];
    if (self) {
        self.state = state;
    }
    return self;
}

- (instancetype)initWithStateMap:(NSDictionary *)stateMap
{
    self = [super init];
    if (self) {
        self.stateMap = stateMap;
    }
    return self;
}

@end
