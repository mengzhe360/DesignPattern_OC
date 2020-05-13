//
//  MZChessBoard.h
//  设计模式
//
//  Created by A5 on 2020/5/13.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MZChessBoard : NSObject

//移动棋盘棋子
- (void)moveChessPiece:(NSString *)chessPieceId posX:(NSInteger)x posY:(NSInteger)y;

@end

NS_ASSUME_NONNULL_END
