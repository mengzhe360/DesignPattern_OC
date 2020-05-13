//
//  MZChessPieceUnit.m
//  设计模式
//
//  Created by A5 on 2020/5/13.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "MZChessPieceUnit.h"


@interface MZChessPieceUnit ()

@property (nonatomic,copy) NSString *ID;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,assign) Color color;

@end

@implementation MZChessPieceUnit

- (instancetype)initWithID:(NSString *)ID name:(NSString *)name color:(Color)color
{
    self.ID = ID;
    self.name = name;
    self.color = color;
    return self;
}



@end
