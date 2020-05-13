//
//  MZChessPieceUnit.h
//  设计模式
//
//  Created by A5 on 2020/5/13.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

//享元 不变的对象

typedef NS_ENUM(NSInteger,Color) {
    RED, BLACK,
};

@interface MZChessPieceUnit : NSObject

- (instancetype)initWithID:(NSString *)ID name:(NSString *)name color:(Color)color;

@end

NS_ASSUME_NONNULL_END
