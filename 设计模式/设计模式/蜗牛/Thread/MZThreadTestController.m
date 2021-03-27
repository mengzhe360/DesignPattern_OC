//
//  MZThreadTestController.m
//  设计模式
//
//  Created by 孟哲 on 2021/3/28.
//  Copyright © 2021 孟哲. All rights reserved.
//

#import "MZThreadTestController.h"

@interface MZThreadTestController ()
{
    dispatch_queue_t concurrent_queue;
    NSMutableArray <NSURL *> *arrayURLs;
    NSMutableDictionary *_userCenterDic;
}

@end

@implementation MZThreadTestController

/*
 1、产生死锁的情况：使用sync函数往当前串行队列中放入任务，会卡主当前串行队列
 2、dispatch_get_main_queue()：主队列是一个串行队列
 3、dispatch_get_global_queue(0, 0)：全局并发队列
 4、异步栅栏调用，必须是自己创建的并发队列
*/

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"MZThreadTestController";
    self.view.backgroundColor = [UIColor redColor];
    
    // 创建并发队列
    concurrent_queue = dispatch_queue_create("concurrent_queue", DISPATCH_QUEUE_CONCURRENT);
    arrayURLs = [NSMutableArray array];
    // 创建数据容器
    _userCenterDic = [NSMutableDictionary dictionary];
   
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
   
    [self lockTestA];
}

//1、同步主队列 - 死锁
- (void)lockTestA
{
    
    MZLog(@"lockTestA-1");
    
    dispatch_queue_t mainQ = dispatch_get_main_queue();
    
    dispatch_sync(mainQ, ^{
        
        MZLog(@"lockTestA-2");
        
    });
    
    MZLog(@"lockTestA-3");
    
}

//2、队列组
- (void)groupTest
{
    // 创建一个group
    dispatch_group_t group = dispatch_group_create();
    
    // for循环遍历各个元素执行操作
    for (NSURL *url in arrayURLs) {
        
        // 异步组分派到并发队列当中
        dispatch_group_async(group, concurrent_queue, ^{
            
            //根据url去下载图片
            
            NSLog(@"url is %@", url);
        });
    }
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        // 当添加到组中的所有任务执行完成之后会调用该Block
        NSLog(@"所有图片已全部下载完成");
    });
    
}

//3、信号 实现多读单写功能
- (void)barrierTest
{
    
}

- (id)objectForKey:(NSString *)key
{
    __block id obj;
    // 同步读取指定数据
    dispatch_async(concurrent_queue, ^{
        obj = [self->_userCenterDic objectForKey:key];
    });
    
    return obj;
}

- (void)setObject:(id)obj forKey:(NSString *)key
{
    // 异步栅栏调用设置数据
    dispatch_barrier_async(concurrent_queue, ^{
        [self->_userCenterDic setObject:obj forKey:key];
    });
}


@end
