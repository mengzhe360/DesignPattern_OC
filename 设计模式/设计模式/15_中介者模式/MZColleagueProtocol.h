//
//  MZColleagueProtocol.h
//  设计模式
//
//  Created by A5 on 2020/5/15.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MZColleagueProtocol <NSObject>

- (void)notify:(NSString *)message;
- (void)send:(NSString *)message;

@end

NS_ASSUME_NONNULL_END
