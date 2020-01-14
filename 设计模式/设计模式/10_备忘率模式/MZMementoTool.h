//
//  MZMementoTool.h
//  设计模式
//
//  Created by A5 on 2020/1/14.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MZMementoTool : NSObject

//原始的存储的状态数据
+ (NSDictionary *)backupProp:(id)object;

//恢复到原始的状态
+ (void)restoreProp:(id)object map:(NSDictionary *)map;

/// 多状态原始数据
/// @param object 发起存储对象
/// @param state 存储节点
+ (NSDictionary *)backupProp:(id)object atState:(NSString *)state;

/// 恢复到指定节点的状态
/// @param object 发起存储对象
/// @param map 原始z对象数据
/// @param state 恢复节点
+ (void)restoreProp:(id)object map:(NSDictionary *)map atState:(NSString *)state;

@end

NS_ASSUME_NONNULL_END
