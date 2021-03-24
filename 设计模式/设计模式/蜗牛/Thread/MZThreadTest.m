//
//  MZThreadTest.m
//  设计模式
//
//  Created by A5 on 2021/3/24.
//  Copyright © 2021 孟哲. All rights reserved.
//

#import "MZThreadTest.h"

@implementation MZThreadTest


- (void)entryPoint
{
    //设置当前线程名为MyThread
    [[NSThread currentThread] setName:@"MyThread"];
    //获取NSRunLoop对象，第一次获取不存在时系统会创建一个
    
    /*
     添加一个Source1事件的监听端口
     RunLoop对象会一直监听这个端口，由于这个端口不会有任何事件到来所以不会产生影响
     监听模式是默认模式，可以修改为Common
     */
    [[NSRunLoop currentRunLoop] addPort:[NSPort port] forMode:NSDefaultRunLoopMode];
    //启动RunLoop
    [[NSRunLoop currentRunLoop] run];
}

- (NSThread *)longTermThread
{
    //静态变量保存常驻内存的线程对象
    static NSThread *longTermThread = nil;
    //使用GCD dispatch_once 在应用生命周期只执行一次常驻线程的创建工作
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //创建一个线程对象，并执行entryPoint方法
        longTermThread = [[NSThread alloc] initWithTarget:self selector:@selector(entryPoint) object:nil];
        //启动线程，启动后就会执行entryPoint方法
        [longTermThread start];
    });
    return longTermThread;
}


- (void)allThead{
    
    dispatch_queue_t serialQueue = dispatch_queue_create("com.lai.www", DISPATCH_QUEUE_SERIAL);
    
    dispatch_queue_t CONCURRENT = dispatch_queue_create("mz",DISPATCH_QUEUE_CONCURRENT);
    
    //获取这个常驻内存的线程
    NSThread *thread =  [self longTermThread];
    
    dispatch_async(serialQueue, ^{
        
        [NSRunLoop currentRunLoop];
        
        NSLog(@"1");
        
        [self performSelector:@selector(perform) withObject:nil afterDelay:0];
        [self performSelector:@selector(perform) withObject:@"在子线程不需要添加到 runloop"];
        [self performSelector:@selector(performThread) onThread:thread withObject:nil waitUntilDone:NO];
        
        NSLog(@"3");
    });
}

- (void)perform
{
    NSLog(@"2");
}

- (void)performThread
{
    NSLog(@"4");
}


@end
