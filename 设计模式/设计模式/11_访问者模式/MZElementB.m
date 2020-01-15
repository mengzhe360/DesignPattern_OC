//
//  MZElementB.m
//  设计模式
//
//  Created by A5 on 2020/1/15.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "MZElementB.h"
#import "MZVisitorProtocol.h"

@implementation MZElementB

- (void)accept:(nonnull id<MZVisitorProtocol>)visitor {
    MZLog(visitor)
    [visitor visitElement:self];
}

- (void)operation {
    MZLog(@"抽象共有方法");
}

- (void)elementBSpecialOperationB:(MZElementBType)type{
    
    if (type == kElementBTypeA) {
        MZLog(@"我要当明星");
    }else{
        MZLog(@"我要成为科学家");
    }
}

@end
