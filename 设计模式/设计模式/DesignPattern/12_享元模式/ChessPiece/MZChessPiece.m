//
//  MZChessPiece.m
//  设计模式
//
//  Created by A5 on 2020/5/13.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "MZChessPiece.h"

@interface MZChessPiece ()

@property (nonatomic,strong) MZChessPieceUnit *Unit;
@property (nonatomic,assign) NSInteger positionX;
@property (nonatomic,assign) NSInteger positionY;

@end

@implementation MZChessPiece

- (instancetype)initWithUnit:(MZChessPieceUnit *)unit positionX:(NSInteger)x positionY:(NSInteger)y
{
    self = [super init];
    if (self) {
        self.Unit = unit;
        self.positionX = x;
        self.positionY = y;
    }
    return self;
}

@end
