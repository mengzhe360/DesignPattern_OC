//
//  MZBaseColleague.m
//  设计模式
//
//  Created by A5 on 2020/5/15.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "MZBaseColleague.h"

@implementation MZBaseColleague

- (instancetype)initWithMediator:(MZMediator *)mediator
{
    self = [super init];
    if (self) {
        self.mediator = mediator;
    }
    return self;
}

- (void)notify:(nonnull NSString *)message {
    
}

- (void)send:(nonnull NSString *)message {
    
}

@end
