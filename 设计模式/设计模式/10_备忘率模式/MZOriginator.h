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

@property (nonatomic,copy) NSString *state0;
@property (nonatomic,copy) NSString *state1;
@property (nonatomic,copy) NSString *state2;

- (MZMemento *)createMemento:(NSString *)state;

- (MZMemento *)createMemento;

- (void)restoreMemento:(MZMemento *)memento;

@end

NS_ASSUME_NONNULL_END
