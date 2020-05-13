//
//  MZChessPiece.h
//  设计模式
//
//  Created by A5 on 2020/5/13.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

//享元基础上的扩展

@class MZChessPieceUnit;

@interface MZChessPiece : NSObject

- (instancetype)initWithUnit:(MZChessPieceUnit *)unit positionX:(NSInteger)x positionY:(NSInteger)y;

@end

NS_ASSUME_NONNULL_END
