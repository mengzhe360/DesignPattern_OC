//
//  MZElementB.m
//  设计模式
//
//  Created by A5 on 2020/1/15.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "MZElementB.h"
#import "MZVisitorProtocol.h"

@interface MZElementB ()

@property (nonatomic,weak) id<MZVisitorProtocol> visitor;

@end

@implementation MZElementB

- (void)accept:(nonnull id<MZVisitorProtocol>)visitor {
    MZLog(visitor)
    _visitor = visitor;
    [visitor visitElement:self];
}

- (void)operation {
    MZLog(@"抽象共有方法");
}

- (void)elementBSpecialOperationB:(MZElementBType)type{
    
    if (type == kElementBTypeA) {
        NSString *A = [NSString stringWithFormat:@"%@我要当明星",_visitor.class];
        MZLog(A);
    }else{
        NSString *A = [NSString stringWithFormat:@"%@我要成为科学家",_visitor.class];
        MZLog(A);
    }
}

@end
