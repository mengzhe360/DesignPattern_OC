//
//  MZMediator.h
//  设计模式
//
//  Created by A5 on 2020/5/15.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

//中间者
@class MZBaseColleague;
@interface MZMediator : NSObject

- (void)send:(NSString *)message colleague:(MZBaseColleague *)colleague;

@end

NS_ASSUME_NONNULL_END
