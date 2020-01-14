//
//  MZMemento.h
//  设计模式
//
//  Created by 孟哲 on 2020/1/14.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
备忘录的角色
*/
NS_ASSUME_NONNULL_BEGIN

@interface MZMemento : NSObject

/// 单一状态
/// @param stateMap 对象内容
- (instancetype)initWithStateMap:(NSDictionary *)stateMap;

/// 多个节点备忘状态
/// @param stateMap 每一个节点的对象存储内容
/// @param state 节点
- (instancetype)initWithStateMap:(NSDictionary *)stateMap atState:(NSString *)state;

//@property (nonatomic,copy) NSString *state;//备忘录保存节点

@property (nonatomic,strong) NSDictionary *stateMap;//存储的备忘点的对象内容

@end

NS_ASSUME_NONNULL_END
