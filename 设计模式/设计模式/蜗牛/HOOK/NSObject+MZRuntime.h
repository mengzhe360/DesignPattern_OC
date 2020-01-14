//
//  NSObject+MZRuntime.h
//  设计模式
//
//  Created by A5 on 2020/1/14.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (MZRuntime)

/* 获取对象的所有属性 */
+(NSArray *)getAllProperties;

/* 获取对象的所有方法 */
+(NSArray *)getAllMethods;

/* 获取对象的所有属性和属性内容 */
+ (NSDictionary *)getAllPropertiesAndVaules:(NSObject *)obj;

@end

NS_ASSUME_NONNULL_END
