//
//  MZChessPieceUnitFactory.h
//  设计模式
//
//  Created by A5 on 2020/5/13.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

//注意理解工厂类缓存享元
//享元模式跟对象池的区别:池化技术中的“复用”可以理解为“重复使用”，主要目的是节省时间（比如从数据库池中取一个连接，不需要重新创建）。在任意时刻，每一个对象、连接、线程，并不会被多处使用，而是被一个使用者独占，当使用完成之后，放回到池中，再由其他使用者重复利用。享元模式中的“复用”可以理解为“共享使用”，在整个生命周期中，都是被所有使用者共享的，主要目的是节省空间

@class MZChessPieceUnit;

@interface MZChessPieceUnitFactory : NSObject

+ (MZChessPieceUnit *)getChessPiece:(NSString *)chessPieceId;

@end

NS_ASSUME_NONNULL_END
