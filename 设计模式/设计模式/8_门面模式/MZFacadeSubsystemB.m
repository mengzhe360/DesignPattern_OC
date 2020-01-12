//
//  MZFacadeSubsystemB.m
//  设计模式
//
//  Created by 孟哲 on 2020/1/12.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "MZFacadeSubsystemB.h"

@implementation MZFacadeSubsystemB

- (void)facadeSubsystemB
{
     NSLog(@"%@-%@",NSStringFromClass(self.class),NSStringFromSelector(_cmd));
}

- (void)facadeSubsystemDelegate
{
    NSLog(@"%@-%@",NSStringFromClass(self.class),NSStringFromSelector(_cmd));
}

@end
