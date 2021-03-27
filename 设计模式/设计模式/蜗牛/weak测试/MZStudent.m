//
//  MZStudent.m
//  设计模式
//
//  Created by A5 on 2020/9/9.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "MZStudent.h"

@implementation MZStudent

- (instancetype)init
{
    if (self = [super init]) {
  
    }
    return self;
}

- (void)textMethod
{
    MZMLog
    if (self.block) {
        self.block();
    }
    
    MZLog(self)//EXC_BAD_ACCESS 访问了一个已经被释放的内存区域
}

- (void)dealloc
{
    MZMLog
}

@end
