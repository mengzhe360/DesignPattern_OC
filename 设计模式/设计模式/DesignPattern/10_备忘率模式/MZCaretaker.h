//
//  MZCaretaker.h
//  设计模式
//
//  Created by 孟哲 on 2020/1/14.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MZMemento.h"

/*
备忘录管理类角色
*/
NS_ASSUME_NONNULL_BEGIN

@interface MZCaretaker : NSObject

@property (nonatomic,strong) MZMemento *memento;//初始备忘录

//@property (nonatomic,strong) NSDictionary *mementoMap;//备忘录保存的所有节点数据

@end

NS_ASSUME_NONNULL_END
