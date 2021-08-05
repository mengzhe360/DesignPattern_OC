//
//  MZElementCollection.h
//  设计模式
//
//  Created by A5 on 2020/1/15.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MZElementProtocol;

@interface MZElementCollection : NSObject

/**
 *  添加元素
 *
 *  @param element 元素
 *  @param key     元素的键值
 */
- (void)addElement:(id <MZElementProtocol>)element withKey:(NSString *)key;

/**
 *  获取所有元素的键值
 *
 *  @return 所有元素的键值
 */
- (NSArray *)allKeys;

/**
 *  根据元素键值获取元素
 *
 *  @param key 元素的键值
 *
 *  @return 元素
 */
- (id <MZElementProtocol>)elementWithKey:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
