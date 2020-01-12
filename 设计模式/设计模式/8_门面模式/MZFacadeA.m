//
//  MZFacadeA.m
//  设计模式
//
//  Created by 孟哲 on 2020/1/12.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "MZFacadeA.h"
#import "MZFacadeSubsystemA.h"
#import "MZFacadeSubsystemB.h"
#import "MZFacadeSubsystemC.h"

@implementation MZFacadeA

- (void)facadeAMethodA
{
    NSLog(@"%@-%@",NSStringFromClass(self.class),NSStringFromSelector(_cmd));
    MZFacadeSubsystemA *A = [[MZFacadeSubsystemA alloc] init];//被委托对象（子系统）
    [A facadeSubsystemA];
    [(id<MZFacadeSubsystem>)A facadeSubsystemDelegate];
}

- (void)facadeAmethodB
{
    NSLog(@"%@-%@",NSStringFromClass(self.class),NSStringFromSelector(_cmd));
    MZFacadeSubsystemB *B = [[MZFacadeSubsystemB alloc] init];
    [B facadeSubsystemB];
    [(id<MZFacadeSubsystem>)B facadeSubsystemDelegate];
}

- (void)facadeAmethodC
{
    NSLog(@"%@-%@",NSStringFromClass(self.class),NSStringFromSelector(_cmd));
    [self performClassName:@"MZContext" selector:@"complexMethod" objects:@[] type:kInstanceMethod];
}

@end
