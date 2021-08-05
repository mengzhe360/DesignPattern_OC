//
//  MZOriginator.h
//  设计模式
//
//  Created by 孟哲 on 2020/1/14.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MZMemento.h"

/*
发起人的角色
*/
NS_ASSUME_NONNULL_BEGIN

@interface MZOriginator : NSObject

@property (nonatomic,copy) NSString *name;//对象内容
@property (nonatomic,copy) NSString *nameA;//对象内容
@property (nonatomic,copy) NSString *nameB;//对象内容

/// 创建备忘录
- (MZMemento *)createMemento;

/// 多节点设置
/// @param state 节点关键值
- (void)setState:(NSString *)state;

/// 恢复初始备忘节点
/// @param memento 原始备忘
- (void)restoreMemento:(MZMemento *)memento;

/// 恢复到指定备忘节点
/// @param memento  原始备忘
/// @param state 节点关键值
- (void)restoreMemento:(MZMemento *)memento atState:(NSString *)state;

@end

NS_ASSUME_NONNULL_END
