
//
//  MZCommandB.m
//  设计模式
//
//  Created by A5 on 2020/5/14.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "MZCommandB.h"
#import "MZInvoker.h"
#import "MZBaseReceiver.h"

@implementation MZCommandB

- (void)execute{
    
    MZLog(@"命令页面变黑色");
    
    [self.receiver doSometing:@"页面变黑色"];
    
    [super done];
}



@end
