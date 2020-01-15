//
//  MZElementA.m
//  设计模式
//
//  Created by A5 on 2020/1/15.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "MZElementA.h"
#import "MZVisitorProtocol.h"

@implementation MZElementA

- (void)accept:(nonnull id<MZVisitorProtocol>)visitor {
    MZLog(visitor);
    [visitor visitElement:self];
}

- (void)operation { 
    MZLog(@"抽象共有方法");
}

- (void)elementASpecialOperationA:(MZElementAType)type{
 
    if (type == kElementATypeA) {
        MZLog(@"我上学去了");
    }else{
        MZLog(@"我打游戏去了");
    }
}

@end
