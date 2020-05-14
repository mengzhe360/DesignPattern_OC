//
//  MZContext.m
//  设计模式
//
//  Created by 孟哲 on 2020/1/13.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "MZContext.h"
#import "MZFacadeSubsystemA.h"
#import "MZFacadeSubsystemB.h"

@implementation MZContext

- (void)complexMethod
{
    MZMLog
    
    MZFacadeSubsystemB *B = [[MZFacadeSubsystemB alloc] init];
    [B facadeSubsystemB];
    [(id<MZFacadeSubsystem>)B facadeSubsystemDelegate];
    
    MZFacadeSubsystemA *A = [[MZFacadeSubsystemA alloc] init];
    [A facadeSubsystemA];
    [(id<MZFacadeSubsystem>)A facadeSubsystemDelegate];    
}

@end
