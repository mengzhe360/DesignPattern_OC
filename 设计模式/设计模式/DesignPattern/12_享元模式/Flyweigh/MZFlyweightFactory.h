//
//  MZFlyweightFactory.h
//  设计模式
//
//  Created by A5 on 2020/1/17.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class MZConcreteFlyweight;

@interface MZFlyweightFactory : NSObject

- (MZConcreteFlyweight *)getFlyweight:(NSString *)extrinsic;

- (NSInteger)getFlyweightCount;

@end

NS_ASSUME_NONNULL_END
