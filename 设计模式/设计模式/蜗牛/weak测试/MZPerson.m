//
//  MZPerson.m
//  设计模式
//
//  Created by A5 on 2020/9/9.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/message.h>
#import "MZPerson.h"
#import "MZStudent.h"
#import "MZResponderChainA.h"

@interface MZPerson ()<MZStudentDelegate>{
    
//    int _a;
//    int _b;
//    NSString *_c;
}

@property (nonatomic,strong) MZStudent *student;//(1)


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
        
        _a = 1;
        _b = 2;
//        _c = @"c";
        MZStudent *student = [[MZStudent alloc] init];//(2)
        student.delegate = self;
        
        __block MZStudent *student1 = [[MZStudent alloc] init];//(3)
        [student1 addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
        //        student1.name = @"mzz";
        self.student = student1; //当有强引用延迟释放时不会崩溃
        __weak typeof(student1) weakstudent1 = student1;
        student1.block = ^{
            dispatch_async(dispatch_get_global_queue(0, 0), ^{
                MZLog([NSThread currentThread])
                weakstudent1.name = @"mz";
            });
            
            //            student1 = nil;
        };
        
//        [student1 textMethod];
        
        
    }
    return self;
}

- (id)copyWithZone:(NSZone *)zone
{
    self.firstName = self.firstName;
    self.lastName = self.lastName;
    return self;
}

/*
 实现isEqual
 先进行指针的判断：如果两个指针相等，那么就是指向一个对象，所以必定相等。然后在进行各个数据的判断
 NSMutableSet当执行addObject会默认调用- (NSUInteger)hash方法
 NSDictionary当执行setObject会默认调用- (NSUInteger)hash方法
 
 苹果为我们提供了相对于NSSet和NSDictionary更通用的两个类NSHashTable和NSMapTable。
 NSHashTable是比NSSet更通用的一个相似物。NSHashTable相对于NSSet/NSMutableSet有如下特征：
 NSSet/NSMutableSet对其对象是强引用，使用isEqual方法去检查对象是否相等，使用方法hash去获取hash值。
 NSHashTable是可变的，没有一个不变的和其对应。
 NSHashTable可以对其对象是weak引用。
 NSHashTable可以在输入（加入）的时候copy对象。
 NSHashTable可以包含任意指针，使用指针去做相等或者hashing检查
 */
- (BOOL)isEqual:(id)object {
    if (self == object) {
        return YES;
    }
    if (![object isKindOfClass:[MZPerson class]]) {
        return NO;
    }
    return [self isEqualToMZPerson:(MZPerson *)object];
}

- (BOOL)isEqualToMZPerson:(MZPerson *)MZPerson {
    if (!MZPerson) {
        return NO;
    }
    BOOL haveEqualFirstName = (!self.firstName && !MZPerson.firstName) || [self.firstName isEqualToString:MZPerson.firstName];
    BOOL haveEqualLastName = (!self.lastName && !MZPerson.lastName) || [self.lastName isEqualToString:MZPerson.lastName];
    return haveEqualFirstName && haveEqualLastName;
}

//重写
- (NSUInteger)hash
{
    [super hash];
    
    NSUInteger firstNameHash = [_firstName hash];
    NSUInteger lastNameHash = [_lastName hash];
    NSUInteger ageHash = _age;
    return firstNameHash ^ lastNameHash ^ ageHash;
}

/**
 isEqual与hash
 1、对于基本类型, ==运算符比较的是值; 对于对象类型, ==运算符比较的是对象的地址(即是否为同一对象)
 2、isEqual是对比对象的值是否都一样
 3、hash方法只在对象被添加至NSSet和设置为NSDictionary的key时会调用；对象相等hash值一定一样，hash值相同对象不一定是同一个
 */
- (void)isEqualObject
{
    UIColor *color1 = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:1.0];
    UIColor *color2 = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:1.0];
//    UIColor *color2 = [UIColor colorWithWhite:0.1 alpha:0.5];
    MZResponderChainA *responderA = [[MZResponderChainA alloc] init];
//    responderA.name = @"responderA";
    
    MZResponderChainA *responderB = [[MZResponderChainA alloc] init];
//    responderB.name = @"responderA";
    
    NSLog(@"color1 == color2 = %@", color1 == color2 ? @"YES" : @"NO");
    NSLog(@"[color1 isEqual:color2] = %@", [color1 isEqual:color2] ? @"YES" : @"NO");
    NSLog(@"color1.hash == color2.hash = %@", color1.hash == color2.hash ? @"YES" : @"NO");
    NSLog(@"[responderA isEqual:responderB] = %@", [responderA isEqual:responderB] ? @"YES" : @"NO");
    NSLog(@"[responderA.hash == responderB.hash] = %@",responderA.hash == responderB.hash ? @"YES" : @"NO");
    
    NSString *stringA = @"BiBoyang";
    NSMutableString *stringB = [stringA mutableCopy];
    
    BOOL equalA = (stringA == stringB);//0
    BOOL equalB = [stringA isEqual:stringB];//1
    BOOL equalC = [stringA isEqualToString:stringB];//1
    
    NSLog(@"equalA = %d  equalB = %d equalC = %d", equalA,equalB,equalC);
    
    //这个字符串的大小如果小于等于96，则保证hash的安全；如果大小大于96了，则无法保证安全，它只会对前32，中32，后32进行hash
    NSString *aaa = @"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaabbbbbbbbbbbbbbbbbbbbbbbbbbbbbbccccccccccccccccccccccccccccccddddddddddddddddddddddddddddddeeeeeeeeeeeeeeeeeeeeeeeeeeeeee";
    NSString *bbb = @"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaabbabbbbbbbbbbbbbbbbbbbbbbbbbbbccccccccccccccccccccccccccccccddddddddddddddddddddddddddddddeeeeeeeeeeeeeeeeeeeeeeeeeeeeee";
        
    BOOL equal1 = (aaa == bbb);//False
    BOOL equal2 = [aaa isEqual:bbb];//False
    BOOL equal3 = ([aaa hash] == [bbb hash]);//True
    
    NSLog(@"equal1 = %d  equal2 = %d equal3 = %d", equal1,equal2,equal3);
    
    /*
     特别注意：yes 一直沿着supeclass指针找到[NSObject class]
            object_getClass是获取isa指向的对象
     */
    BOOL m = [MZPerson isKindOfClass:[NSObject class]];//yes
    BOOL n = [MZPerson isMemberOfClass:[NSObject class]];//NO
    BOOL x = [MZPerson isMemberOfClass:object_getClass([MZPerson class])];//yes
    
    NSLog(@"m = %d  n = %d z = %d", m,n,x);
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    MZLog([NSThread currentThread])
}

- (void)setAge:(int)age
{
    _age = age;
    MZLog(@"kvo");
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
