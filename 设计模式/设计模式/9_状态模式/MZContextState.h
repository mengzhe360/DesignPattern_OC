//
//  MZContextState.h
//  设计模式
//
//  Created by A5 on 2020/1/13.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MZAbstractState.h"

NS_ASSUME_NONNULL_BEGIN

static _concreteStateA;
static _concreteStateB;

@interface MZContextState : NSObject

@property (nonatomic,strong) MZAbstractState *currentState;

- (void)contextStateHandleC:(NSString *)state;

- (void)contextStateHandleD:(NSString *)state;

@end

NS_ASSUME_NONNULL_END
