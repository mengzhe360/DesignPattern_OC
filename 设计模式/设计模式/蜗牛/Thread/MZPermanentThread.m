//
//  MZPermanentThread.m
//  设计模式
//
//  Created by A5 on 2020/8/29.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "MZPermanentThread.h"

@interface MZThread : NSThread

@end

@implementation MZThread

@end

@interface MZPermanentThread ()

@property (nonatomic,strong) MZThread *mzThread;
@property (nonatomic,assign,getter=isStopped) BOOL stopped;


@end

@implementation MZPermanentThread


- (instancetype)init
{
    if (self = [super init]) {
        __weak typeof(self) weakself = self;
        self.mzThread = [[MZThread alloc] initWithBlock:^{
            
            //1、
            [[NSRunLoop currentRunLoop] addPort:[NSPort new] forMode:NSDefaultRunLoopMode];
            while (weakself && !weakself.isStopped) {
                [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
            }
            
            //2、
            CFRunLoopSourceContext context = {0};
            
            CFRunLoopSourceRef source = CFRunLoopSourceCreate(kCFAllocatorDefault, 0, &context);
            
            CFRunLoopAddSource(CFRunLoopGetCurrent(), source, kCFRunLoopDefaultMode);
            
            CFRelease(source);
            
            while (weakself && !weakself.isStopped) {
                //设置true 代表执行完source后就会退出当前loop
                CFRunLoopRunInMode(kCFRunLoopDefaultMode, 1.0e10, true);
            }
            
        }];
        
    }
    
    return self;
}

- (void)run
{
    [self.mzThread start];
}

- (void)executeTaskBlock:(PermanentThreadTask)task
{
    if (!self.mzThread || !task) return;
    [self performSelector:@selector(__executeTaskBlock:) onThread:self.mzThread withObject:task waitUntilDone:NO];
}

- (void)stop
{
    if (!self.mzThread ) return;
    
    [self performSelector:@selector(__stop) onThread:self.mzThread withObject:nil waitUntilDone:YES];
}

- (void)__stop
{
    self.stopped = YES;
    CFRunLoopStop(CFRunLoopGetCurrent());
    self.mzThread = nil;
}

- (void)__executeTaskBlock:(PermanentThreadTask)task
{
    task();
}

- (void)dealloc
{
    [self stop];
}

@end
