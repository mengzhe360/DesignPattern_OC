//
//  MZPerson.m
//  设计模式
//
//  Created by A5 on 2020/9/9.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "MZPerson.h"
#import "MZStudent.h"

@interface MZPerson ()<MZStudentDelegate>{
    
//    int _a;
//    int _b;
//    NSString *_c;
}

//@property (nonatomic,strong) MZStudent *student;//(1)


@end

@implementation MZPerson

/*
 1、当MZPerson强引用MZStudent时，MZStudentDelegate要weak修饰，不会循环引用
 
 2、当MZPerson为局部变量所引用MZStudent时，MZStudentDelegate可以weak或者strong修饰，都不会循环引用
 
 3、EXC_BAD_ACCESS 访问了一个已经被释放的内存区域
 
 4、KVO在主线程监听，在哪个线程触发，就在哪个线程回调
 */

- (instancetype)init
{
    if (self = [super init]) {
        
//        _a = 1;
//        _b = 2;
//        _c = @"c";
//        MZStudent *student = [[MZStudent alloc] init];//(2)
//        student.delegate = self;
//        
//        __block MZStudent *student1 = [[MZStudent alloc] init];//(3)
//        [student1 addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
////        student1.name = @"mzz";
//        self.student = student1; //当有强引用延迟释放时不会崩溃
//        __weak typeof(student1) weakstudent1 = student1;
//        student1.block = ^{
//            dispatch_async(dispatch_get_global_queue(0, 0), ^{
//                MZLog([NSThread currentThread])
//                weakstudent1.name = @"mz";
//            });
//            
//            //            student1 = nil;
//        };
//        
//        [student1 textMethod];
        
        
    }
    return self;
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    MZLog([NSThread currentThread])
}

- (void)reTest
{
    
}

- (void)dealloc
{
    MZMLog
    
//    [self.student removeObserver:self forKeyPath:@"name" context:nil];
}

@end
