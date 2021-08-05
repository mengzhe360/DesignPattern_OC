//
//  MZElementA.m
//  设计模式
//
//  Created by A5 on 2020/1/15.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "MZElementA.h"
#import "MZVisitorProtocol.h"

@interface MZElementA ()

@property (nonatomic,weak) id<MZVisitorProtocol> visitor;

@end

@implementation MZElementA

- (void)accept:(nonnull id<MZVisitorProtocol>)visitor {
    MZLog(visitor);
    _visitor = visitor;
    [visitor visitElement:self];
}

- (void)operation { 
    MZLog(@"抽象共有方法");
}

- (void)elementASpecialOperationA:(MZElementAType)type{
 
    if (type == kElementATypeA) {
        NSString *A = [NSString stringWithFormat:@"%@不是好学生-我打游戏去了",_visitor.class];
        MZLog(A);
    }else{
        NSString *A = [NSString stringWithFormat:@"%@未来国家栋梁-我上学去了",_visitor.class];
        MZLog(A);
    }
}

@end
