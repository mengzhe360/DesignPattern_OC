//
//  NSObject+MZPerformSelector.h
//  设计模式
//
//  Created by A5 on 2020/1/9.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger,RequestMethodType) {
    kInstanceMethod,
    kClassMethod,
};

@interface NSObject (MZPerformSelector)

- (id)performClassName:(NSString *)className selector:(NSString *)selectorStr withObjects:(NSArray <id> *)objects type:(RequestMethodType)type;

+ (id)objectForClassName:(NSString *)className;

@end

NS_ASSUME_NONNULL_END
