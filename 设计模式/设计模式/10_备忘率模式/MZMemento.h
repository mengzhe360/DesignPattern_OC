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

- (instancetype)initWithState:(NSString *)state;

- (instancetype)initWithStateMap:(NSDictionary *)stateMap;

@property (nonatomic,copy) NSString *state;

@property (nonatomic,strong) NSDictionary *stateMap;

@end

NS_ASSUME_NONNULL_END
