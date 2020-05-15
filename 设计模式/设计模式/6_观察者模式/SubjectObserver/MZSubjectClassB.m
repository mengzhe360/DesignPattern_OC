//
//  MZSubjectClassB.m
//  设计模式
//
//  Created by A5 on 2020/5/15.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "MZSubjectClassB.h"

@implementation MZSubjectClassB

- (void)doSomething:(NSString *)str;
{
    
    MZLog(str)
    
    [super postNotifyObervers];
    
}

@end
