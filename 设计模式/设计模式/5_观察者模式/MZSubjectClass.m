//
//  MZSubject.m
//  设计模式
//
//  Created by 孟哲 on 2020/1/9.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "MZSubjectClass.h"
#import "MZSubjectProtocol.h"
#import "MZObserverClass.h"

@interface MZSubjectClass ()<MZSubjectProtocol>

@property (nonatomic,strong) NSMutableArray <MZObserverClass *> *observers;

@end

@implementation MZSubjectClass

- (void)addObserver:(MZObserverClass *)observer;
{
    [self.observers addObject:observer];
}

- (void)deleteObserver:(MZObserverClass *)observer
{
    [self.observers removeObject:observer];
}

- (void)postNotifyObervers
{
    
    [self.observers enumerateObjectsUsingBlock:^(MZObserverClass * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        [obj update];//执行
        
    }];
    
}

- (NSMutableArray<MZObserverClass *> *)observers
{
    if (!_observers) {
        _observers = [[NSMutableArray alloc] init];
    }
    return _observers;
}


@end
