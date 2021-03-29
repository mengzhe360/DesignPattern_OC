//
//  NSObject+MZ_KVO.h
//  设计模式
//
//  Created by A5 on 2021/3/29.
//  Copyright © 2021 孟哲. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (MZ_KVO)

- (void)mz_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context;

@end

NS_ASSUME_NONNULL_END
