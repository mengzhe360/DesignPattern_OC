//
//  MZComponent.h
//  设计模式
//
//  Created by 孟哲 on 2020/1/11.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MZComponent : NSObject

@property (nonatomic,copy) NSString *name;

//父节点
@property (nonatomic,strong) MZComponent *parentComponent;

- (void)operationSomething;

@end

NS_ASSUME_NONNULL_END
