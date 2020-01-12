//
//  MZTestDelegateA.m
//  设计模式
//
//  Created by 孟哲 on 2020/1/12.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "MZTestDelegateA.h"

@implementation MZTestDelegateA

- (void)mzTestOne
{
     NSLog(@"%@-%@",NSStringFromClass(self.class),NSStringFromSelector(_cmd));
}

- (void)mzTestTwo
{
     NSLog(@"%@-%@",NSStringFromClass(self.class),NSStringFromSelector(_cmd));
}


@end
