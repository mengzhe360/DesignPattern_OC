//
//  MZChessPieceUnitFactory.m
//  设计模式
//
//  Created by A5 on 2020/5/13.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "MZChessPieceUnitFactory.h"
#import "MZChessPieceUnit.h"

static  NSMutableDictionary  *_chessPiecesMDict = nil;

@implementation MZChessPieceUnitFactory

+ (void)initialize
{
    if (self == [MZChessPieceUnitFactory class]) {
        _chessPiecesMDict = [[NSMutableDictionary alloc] init];
    }
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        MZChessPieceUnit *RED1 = [[MZChessPieceUnit alloc] initWithID:@"RED1" name:@"车马炮" color:RED];
        MZChessPieceUnit *BLACK1 = [[MZChessPieceUnit alloc] initWithID:@"BLACK1" name:@"车马炮" color:BLACK];
        MZChessPieceUnit *RED2 = [[MZChessPieceUnit alloc] initWithID:@"RED2" name:@"兵侍象" color:RED];
        MZChessPieceUnit *BLACK2 = [[MZChessPieceUnit alloc] initWithID:@"BLACK2" name:@"兵侍象" color:BLACK];
        MZChessPieceUnit *RED3 = [[MZChessPieceUnit alloc] initWithID:@"RED3" name:@"蒋" color:RED];
        MZChessPieceUnit *BLACK3 = [[MZChessPieceUnit alloc] initWithID:@"BLACK3" name:@"帅" color:BLACK];
        [_chessPiecesMDict setObject:RED1 forKey:@"RED1"];
        [_chessPiecesMDict setObject:BLACK1 forKey:@"BLACK1"];
        [_chessPiecesMDict setObject:RED2 forKey:@"RED2"];
        [_chessPiecesMDict setObject:BLACK2 forKey:@"BLACK2"];
        [_chessPiecesMDict setObject:RED3 forKey:@"RED3"];
        [_chessPiecesMDict setObject:BLACK3 forKey:@"BLACK3"];
        
    }
    return self;
}

+ (MZChessPieceUnit *)getChessPiece:(NSString *)chessPieceId
{
    if ([_chessPiecesMDict objectForKey:chessPieceId]) {
        return [_chessPiecesMDict objectForKey:chessPieceId];
    }else{
        MZLog(@"享元对象不存在")
        return nil;
    }
}

@end
