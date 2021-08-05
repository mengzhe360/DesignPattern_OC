//
//  MZSubjectClassA.m
//  设计模式
//
//  Created by 孟哲 on 2020/1/9.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "MZSubjectClassA.h"

@implementation MZSubjectClassA

- (void)doSomething:(NSString *)str;
{
    
    MZLog(str)
    
    [super postNotifyObervers];
    
}

@end
