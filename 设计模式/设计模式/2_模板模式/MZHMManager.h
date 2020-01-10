//
//  MZHMManager.h
//  设计模式
//
//  Created by 孟哲 on 2020/1/6.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MZHMProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface MZHMManager : NSObject<MZHMProtocol>

- (void)run NS_REQUIRES_SUPER;

@end

NS_ASSUME_NONNULL_END
