//
//  MZPermanentThread.h
//  设计模式
//
//  Created by A5 on 2020/8/29.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^PermanentThreadTask)(void);

@interface MZPermanentThread : NSObject

- (void)run;

- (void)executeTaskBlock:(PermanentThreadTask)task;

- (void)stop;

@end

NS_ASSUME_NONNULL_END
