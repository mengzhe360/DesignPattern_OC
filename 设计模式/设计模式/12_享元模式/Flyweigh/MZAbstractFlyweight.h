//
//  MZAbstractFlyweight.h
//  设计模式
//
//  Created by A5 on 2020/1/17.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MZAbstractFlyweight : NSObject

@property (nonatomic,copy) NSString *intrinsic;

- (instancetype)initWithExtrinsic:(NSString *)extrinsic;

- (void)operate:(NSString *)extrinsic;

@end

NS_ASSUME_NONNULL_END
