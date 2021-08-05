//
//  MZChessBoard.m
//  设计模式
//
//  Created by A5 on 2020/5/13.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "MZChessBoard.h"
#import "MZChessPiece.h"
#import "MZChessPieceUnitFactory.h"

@interface MZChessBoard ()

@property (nonatomic,strong) NSMutableDictionary *chessBoardMDict;

@end

@implementation MZChessBoard

//初始化摆放棋盘棋子
- (instancetype)init
{
    self = [super init];
    if (self) {

        MZChessPiece *RED1 = [[MZChessPiece alloc] initWithUnit:[MZChessPieceUnitFactory getChessPiece:@"RED1"] positionX:1 positionY:1];
        [self.chessBoardMDict setObject:RED1 forKey:@"RED1"];
        MZChessPiece *BLACK1 = [[MZChessPiece alloc] initWithUnit:[MZChessPieceUnitFactory getChessPiece:@"BLACK1"] positionX:1 positionY:1];
        [self.chessBoardMDict setObject:BLACK1 forKey:@"BLACK1"];
        MZChessPiece *RED2 = [[MZChessPiece alloc] initWithUnit:[MZChessPieceUnitFactory getChessPiece:@"RED2"] positionX:1 positionY:1];
        [self.chessBoardMDict setObject:RED2 forKey:@"RED2"];
        MZChessPiece *BLACK2 = [[MZChessPiece alloc] initWithUnit:[MZChessPieceUnitFactory getChessPiece:@"BLACK2"] positionX:1 positionY:1];
        [self.chessBoardMDict setObject:BLACK2 forKey:@"BLACK2"];
        MZChessPiece *RED3 = [[MZChessPiece alloc] initWithUnit:[MZChessPieceUnitFactory getChessPiece:@"RED3"] positionX:1 positionY:1];
        [self.chessBoardMDict setObject:RED3 forKey:@"RED1"];
        MZChessPiece *BLACK3 = [[MZChessPiece alloc] initWithUnit:[MZChessPieceUnitFactory getChessPiece:@"BLACK3"] positionX:1 positionY:1];
        [self.chessBoardMDict setObject:BLACK3 forKey:@"BLACK3"];
    
    }
    return self;
}

- (void)moveChessPiece:(NSString *)chessPieceId posX:(NSInteger)x posY:(NSInteger)y
{
    
}

- (NSMutableDictionary *)chessBoardMDict
{
    if (!_chessBoardMDict) {
        _chessBoardMDict = [NSMutableDictionary dictionary];
    }
    return _chessBoardMDict;
}

@end
