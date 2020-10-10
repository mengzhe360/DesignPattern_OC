//
//  MOFTimerTool.h
//  MOF
//
//  Created by 孟哲 on 2019/6/17.
//  Copyright © 2019 iloc.cc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MOFTimerTool : NSObject

/**
 定时器
 
 @param interval 时间间隔
 @param yesOrNo 是否循环
 @param timerBlock 定时器回调
 @return 定时器
 */
+ (NSTimer *)timerManagerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)yesOrNo withTimerBlock:(void (^)(void))timerBlock;

@end

NS_ASSUME_NONNULL_END
