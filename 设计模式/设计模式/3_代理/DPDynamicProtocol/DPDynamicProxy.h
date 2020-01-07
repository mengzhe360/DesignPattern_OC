//
//  DPDynamicProxy.h
//  单例释放
//
//  Created by A5 on 2020/1/2.
//  Copyright © 2020 mengzhe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DPDynamicProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface DPDynamicProxy : NSProxy

@property (nonatomic,strong) id<DPDynamicProtocol> target;

- (id)initWithObject:(id<DPDynamicProtocol>)obj;

@end

NS_ASSUME_NONNULL_END
