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

- (MZMemento *)createMemento:(NSString *)state
{
    MZMLog
    return [[MZMemento alloc] initWithState:state];
}

- (MZMemento *)createMemento
{
    MZMLog
    return [[MZMemento alloc] initWithStateMap:[MZMementoTool backupProp:self]];
}

- (void)restoreMemento:(MZMemento *)memento
{
    MZMLog
//   [self setState:memento.state];
    [MZMementoTool restoreProp:self map:memento.stateMap];
}

@end
