//
//  MZFacadeA.h
//  设计模式
//
//  Created by 孟哲 on 2020/1/12.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// 门面类 处理子系统逻辑处理入口
@interface MZFacadeA : NSObject

- (void)facadeAMethodA;
- (void)facadeAmethodB;
- (void)facadeAmethodC;

@end

NS_ASSUME_NONNULL_END
