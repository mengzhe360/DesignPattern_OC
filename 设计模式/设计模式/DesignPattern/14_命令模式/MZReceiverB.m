//
//  MZReceiverB.m
//  设计模式
//
//  Created by A5 on 2020/5/14.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "MZReceiverB.h"

@implementation MZReceiverB

- (void)doSometing:(NSString *)action{
    NSString *ac = [NSString stringWithFormat:@"执行%@",action];
    MZLog(ac);
}

@end
