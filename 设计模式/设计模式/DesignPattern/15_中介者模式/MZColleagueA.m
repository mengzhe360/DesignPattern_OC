//
//  MZColleagueA.m
//  设计模式
//
//  Created by A5 on 2020/5/15.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "MZColleagueA.h"

@implementation MZColleagueA

- (void)notify:(nonnull NSString *)message {
    MZLog(message)
    [self.mediator send:message colleague:self];
}

- (void)send:(nonnull NSString *)message {
   NSString *action = [NSString stringWithFormat:@"执行：%@",message];
   MZLog(action)
}

- (void)actionColleagueA:(NSString *)action{
    MZLog(@"执行自己特有的逻辑")
}

@end
