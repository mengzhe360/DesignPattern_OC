//
//  MZVisitorB.m
//  设计模式
//
//  Created by A5 on 2020/1/15.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "MZVisitorB.h"
#import "MZElementA.h"
#import "MZElementB.h"

@implementation MZVisitorB

- (void)visitElement:(id <MZElementProtocol>)element
{
    [element operation];
    
    if ([element isMemberOfClass:[MZElementA class]]) {
        [self performClass:element selector:@"elementASpecialOperationA:" objects:@[@1] type:kInstanceMethod];
    } else if ([element isMemberOfClass:[MZElementB class]]) {
        [self performClass:element selector:@"elementBSpecialOperationB:" objects:@[@1] type:kInstanceMethod];
    }
}

@end
