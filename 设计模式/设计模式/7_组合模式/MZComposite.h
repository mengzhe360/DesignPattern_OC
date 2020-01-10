//
//  MZComposite.h
//  设计模式
//
//  Created by 孟哲 on 2020/1/11.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "MZComponent.h"

NS_ASSUME_NONNULL_BEGIN

@interface MZComposite : MZComponent

//增加一个树枝构件或者叶子构件
- (void)add:(MZComponent *)component;

//删除一个树枝构件或者叶子构件
- (void)remove:(MZComponent *)component;

//过去分支下的所有树枝构件和者叶子构件
- (NSArray <MZComponent *>*)getChildren;

@end

NS_ASSUME_NONNULL_END
