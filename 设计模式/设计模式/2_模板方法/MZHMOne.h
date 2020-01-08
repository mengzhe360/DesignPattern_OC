//
//  MZHMOne.h
//  设计模式
//
//  Created by 孟哲 on 2020/1/6.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "MZHMManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface MZHMOne : MZHMManager

@property (nonatomic, assign) BOOL alarmFlag;
- (void)setAlarm:(BOOL)isAlarm;

@end

NS_ASSUME_NONNULL_END
