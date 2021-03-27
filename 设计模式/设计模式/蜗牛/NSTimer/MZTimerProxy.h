//
//  MZTimerProxy.h
//  设计模式
//
//  Created by 孟哲 on 2021/3/27.
//  Copyright © 2021 孟哲. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MZTimerProxy : NSProxy

@property (weak, nonatomic) id target;

+ (instancetype)proxyWithTarget:(id)target;

@end

NS_ASSUME_NONNULL_END
