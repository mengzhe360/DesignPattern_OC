//
//  MZMediator.m
//  设计模式
//
//  Created by A5 on 2020/5/15.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "MZMediator.h"
#import "MZBaseColleague.h"
#import "MZColleagueA.h"
#import "MZColleagueB.h"

@implementation MZMediator

- (void)send:(NSString *)message colleague:(MZBaseColleague *)colleague{
   
    if ([colleague isMemberOfClass:NSClassFromString(@"MZColleagueA")]) {

        [(MZColleagueA *)colleague actionColleagueA:message];

    }else if ([colleague isMemberOfClass:NSClassFromString(@"MZColleagueB")]){

        [(MZColleagueB *)colleague actionColleagueB:message];
    }
    
    [colleague send:message];//公有逻辑
    
}

@end
