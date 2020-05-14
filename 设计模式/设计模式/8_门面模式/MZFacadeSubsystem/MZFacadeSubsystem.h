//
//  MZFacadeSubsystem.h
//  设计模式
//
//  Created by 孟哲 on 2020/1/12.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

//门面模式为子系统提供一组统一的接口，定义一组高层接口让子系统更易用。

@protocol MZFacadeSubsystem <NSObject>

- (void)facadeSubsystemDelegate;

@end

NS_ASSUME_NONNULL_END
