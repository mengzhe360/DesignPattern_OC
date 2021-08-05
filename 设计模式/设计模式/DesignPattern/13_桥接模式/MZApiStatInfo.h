//
//  MZApiStatInfo.h
//  设计模式
//
//  Created by 孟哲 on 2020/2/28.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MZApiStatInfo : NSObject

@property (nonatomic,copy) NSString *api;
@property (nonatomic,assign) long requestCount;
@property (nonatomic,assign) long errorCount;
@property (nonatomic,assign) long durationSeconds;

@end

NS_ASSUME_NONNULL_END
