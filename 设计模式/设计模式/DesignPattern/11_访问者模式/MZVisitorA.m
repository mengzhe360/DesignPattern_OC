//
//  MZVisitorA.m
//  设计模式
//
//  Created by A5 on 2020/1/15.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "MZVisitorA.h"
#import "MZElementA.h"
#import "MZElementB.h"

@implementation MZVisitorA

- (void)visitElement:(id <MZElementProtocol>)element
{
    [element operation];
    if ([element isMemberOfClass:[MZElementA class]]) {
        [self performClass:element selector:@"elementASpecialOperationA:" objects:@[@2] type:kInstanceMethod];
    } else if ([element isMemberOfClass:[MZElementB class]]) {
        [self performClass:element selector:@"elementBSpecialOperationB:" objects:@[@2] type:kInstanceMethod];
    }
}

@end
