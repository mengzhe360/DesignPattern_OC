//
//  MZAlertHandlerAbstract.h
//  设计模式
//
//  Created by 孟哲 on 2020/2/28.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MZNotificationAbstract.h"

NS_ASSUME_NONNULL_BEGIN

@class MZApiStatInfo;

@interface MZAlertHandlerAbstract : NSObject

@property (nonatomic,strong) MZNotificationAbstract *notification;

- (instancetype)initWithNotification:(MZNotificationAbstract *)notification;

- (void)handlerCheck:(MZApiStatInfo *)apiStatInfo;

@end

NS_ASSUME_NONNULL_END
