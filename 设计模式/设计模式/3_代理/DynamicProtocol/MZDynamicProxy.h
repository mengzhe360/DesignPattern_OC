//
//  MZDynamicProxy.h
//  设计模式
//
//  Created by 孟哲 on 2020/1/7.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MZDynamicProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface MZDynamicProxy : NSProxy

@property (nonatomic,strong) id<MZDynamicProtocol> target;

- (id)initWithObject:(id<MZDynamicProtocol>)obj;

@end

NS_ASSUME_NONNULL_END
