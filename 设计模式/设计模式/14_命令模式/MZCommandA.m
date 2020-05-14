//
//  MZCommandA.m
//  设计模式
//
//  Created by A5 on 2020/5/14.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "MZCommandA.h"
#import "MZInvoker.h"
#import "MZBaseReceiver.h"

@implementation MZCommandA

- (void)execute{
    
    MZLog(@"命令页面变白色");
    
    [self.receiver doSometing:@"页面变白色"];
    
    [super done];
}



@end
