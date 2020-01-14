//
//  MZConcreteStateB.h
//  设计模式
//
//  Created by A5 on 2020/1/13.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "MZAbstractState.h"

NS_ASSUME_NONNULL_BEGIN

@interface MZConcreteStateB : MZAbstractState

+ (instancetype)sharedInstance;

@end

NS_ASSUME_NONNULL_END
