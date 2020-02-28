//
//  MZContextManager.h
//  设计模式
//
//  Created by 孟哲 on 2020/2/28.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class MZAlert;

@interface MZBridgeManager : NSObject

+ (instancetype)sharedInstance;

- (void)initializeBeansData;

- (MZAlert *)getAlert;

@end

NS_ASSUME_NONNULL_END
