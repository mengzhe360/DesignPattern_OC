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

- (MZMemento *)createMemento;

- (void)setState:(NSString *)state;

- (void)restoreMemento:(MZMemento *)memento;

- (void)restoreMemento:(MZMemento *)memento atState:(NSString *)state;

@end

NS_ASSUME_NONNULL_END
