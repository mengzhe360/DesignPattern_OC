//
//  MZOriginator.m
//  设计模式
//
//  Created by 孟哲 on 2020/1/14.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "MZOriginator.h"
#import "MZMemento.h"
#import "MZMementoTool.h"

@interface MZOriginator ()

@end

@implementation MZOriginator

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = @"";
        self.nameA = @"";
        self.nameB = @"";
    }
    return self;
}

- (MZMemento *)createMemento
{
    MZMLog
    return [[MZMemento alloc] initWithStateMap:[MZMementoTool backupProp:self]];
}

- (void)restoreMemento:(MZMemento *)memento
{
    MZLog(memento.stateMap)
    [MZMementoTool restoreProp:self map:memento.stateMap];
}

- (void)setState:(NSString *)state
{
    MZLog(state)
    [MZMementoTool backupProp:self atState:state];
}

- (void)restoreMemento:(MZMemento *)memento atState:(NSString *)state
{
    MZLog(@"初始值")
    MZLog(memento.stateMap)
    [MZMementoTool restoreProp:self map:memento.stateMap atState:state];
}



@end
