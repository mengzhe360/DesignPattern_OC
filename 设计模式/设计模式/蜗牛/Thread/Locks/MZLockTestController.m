//
//  MZLockTestController.m
//  设计模式
//
//  Created by 孟哲 on 2021/3/27.
//  Copyright © 2021 孟哲. All rights reserved.
//

#import "MZLockTestController.h"

@interface MZLockTestController ()

@property(nonatomic,strong)NSLock *mlock;

@end

@interface MZLockTestController ()

@end

@implementation MZLockTestController

/*
 目的：为了线程同步
 1、natomic：只是在内部给属性的 set 和 get 方法加锁，在外部取用不起作用
 */
- (instancetype)init
{
    self = [super init];
    if (self) {
        _mlock = [[NSLock alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title = @"MZLockTestController";
    self.view.backgroundColor = [UIColor redColor];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self lockTestB];
}

- (void)lockTestB
{
    
    dispatch_queue_global_t queue = dispatch_get_global_queue(0, 0);
    
    [_mlock lock];
    
    dispatch_async(queue, ^{
        
        sleep(2);
    
        [self lockTestB];
        MZLog(@"lockTestB-1");
        
    });
    
    [_mlock unlock];
    
 
}

- (void)mzLockTest
{
    
    dispatch_queue_global_t queue = dispatch_get_global_queue(0, 0);
    
    dispatch_async(queue, ^{
        
        [self->_mlock lock];
        
        sleep(2);
        
        [self->_mlock unlock];
        
    });
    
    
}


@end
