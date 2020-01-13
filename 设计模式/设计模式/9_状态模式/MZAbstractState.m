//
//  MZAbstractState.m
//  设计模式
//
//  Created by A5 on 2020/1/13.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "MZAbstractState.h"

@implementation MZAbstractState

- (instancetype)init
{
    if ([self isMemberOfClass:[MZAbstractState class]]) {
        NSAssert(![self isMemberOfClass:[MZAbstractState class]], @"AbstractDownloader is an abstract class, you should not instantiate it directly.");
        [self doesNotRecognizeSelector:_cmd];
        return nil;
    }else{
        self = [super init];
        if (self) {

        }
        return self;
    }
}

- (void)setContextState:(MZContextState *)contextState
{
    _contextState = contextState;
}

- (void)stateHandleA{
     AbstractMethodNotImplemented();
}

- (void)stateHandleB{
     AbstractMethodNotImplemented();
}


@end
