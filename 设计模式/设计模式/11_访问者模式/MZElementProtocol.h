//
//  MZElementProtocol.h
//  设计模式
//
//  Created by A5 on 2020/1/15.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MZVisitorProtocol;

NS_ASSUME_NONNULL_BEGIN

@protocol MZElementProtocol <NSObject>

/**
 *  接收访问者（核心方法）
 *
 *  @param visitor 访问者对象
 */
- (void)accept:(id <MZVisitorProtocol>)visitor;

/**
 *  元素公共的操作
 */
- (void)operation;

@end

NS_ASSUME_NONNULL_END
