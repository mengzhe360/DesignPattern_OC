//
//  MZAlert.m
//  设计模式
//
//  Created by 孟哲 on 2020/2/28.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "MZAlert.h"
#import "MZAlertHandlerAbstract.h"

@interface MZAlert ()

@property (nonatomic,strong) NSMutableArray <MZAlertHandlerAbstract *>*alertHandlers;

@end

@implementation MZAlert

- (void)addAlertHandler:(MZAlertHandlerAbstract *)alertHandler
{
    [self.alertHandlers addObject:alertHandler];
}

- (void)alertCheck:(MZApiStatInfo *)apiStatInfo
{
    [self.alertHandlers enumerateObjectsUsingBlock:^(MZAlertHandlerAbstract * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj handlerCheck:apiStatInfo];
    }];
}

- (NSMutableArray<MZAlertHandlerAbstract *> *)alertHandlers
{
    if (!_alertHandlers) {
        _alertHandlers = [NSMutableArray new];
    }
    return _alertHandlers;
}

@end
