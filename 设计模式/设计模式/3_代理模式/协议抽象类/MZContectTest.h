//
//  MZContectTest.h
//  设计模式
//
//  Created by A5 on 2020/5/28.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MZTestDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface MZContectTest : NSObject

@property (nonatomic,weak) id<MZTestDelegate> delegate;

- (void)action;

@end

NS_ASSUME_NONNULL_END
