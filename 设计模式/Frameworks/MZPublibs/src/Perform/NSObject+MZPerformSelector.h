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

//传入统一的对象
- (id)performClass:(id)aClass selector:(NSString *)aSEL objects:(NSArray <id> *)objects type:(RequestMethodType)type;

//每次调用自动生成一个对象
- (id)performClassName:(NSString *)className selector:(NSString *)aSEL objects:(NSArray <id> *)objects type:(RequestMethodType)type;

+ (id)objectForClassName:(NSString *)className;

@end

NS_ASSUME_NONNULL_END
