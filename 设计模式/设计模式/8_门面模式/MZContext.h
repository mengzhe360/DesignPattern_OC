//
//  MZContext.h
//  设计模式
//
//  Created by 孟哲 on 2020/1/13.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// 扩展封装类 ，目的是为了门面内不处理子系统之间的业务逻辑，由这个扩展类来处理，减少耦合性
@interface MZContext : NSObject

- (void)complexMethod;

@end

NS_ASSUME_NONNULL_END
