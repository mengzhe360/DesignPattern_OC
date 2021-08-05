//
//  MZAbstractState.h
//  设计模式
//
//  Created by A5 on 2020/1/13.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class MZContextState;

@interface MZAbstractState : NSObject

@property (nonatomic,strong) MZContextState *contextState;

- (void)stateHandleA;

- (void)stateHandleB;

@end

NS_ASSUME_NONNULL_END
