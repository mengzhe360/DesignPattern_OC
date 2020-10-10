//
//  MZBlockViewController.m
//  设计模式
//
//  Created by A5 on 2020/5/19.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "MZBlockViewController.h"
#import "MZResponderChainA.h"

typedef void(^MZBlock)(NSString *mz);

@interface MZBlockViewController ()

@property(nonatomic,strong)NSArray *arr;
@property (nonatomic,copy) void(^mzBlock)(NSString *m,NSString *n);

@end

@implementation MZBlockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //一个函数「或指向函数的指针」+ 该函数执行的外部的上下文变量「也就是自由变量」= block
    self.view.backgroundColor = UIColor.orangeColor;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    [self blockTest2];
    
}

- (void)ppintTest
{
    int a = 10;
    int *p = &a;
    NSLog(@"\np = %p,\n*p = %d,\n&p = %p,\na = %d，\n&a = %p\n",p,*p,&p,a,&a);
    //结果：p = 0x7ffeeb92e49c,*p = 10,&p = 0x7ffeeb92e490,a = 10，&a = 0x7ffeeb92e49c
    
    NSString *str = @"mz";
    NSString *str1 = str;
    
    NSLog(@"\nstr = %@\nstrP = %p\n&str = %p\nstr1 = %@\nstr1P = %p\n&str1 = %p\n",str,str,&str,str1,str1,&str1);
}

/*
 1、__block修饰的基本数据a，被block内部捕获，会拷贝一个新的a，以后再用这个a时，其实用的是block内新拷贝的a
 2、static修饰的基本数据b，是指针传递，生命周期内用的都是同一个b
 3、auto修饰的基本数据c，是值传递，当被block内部捕获时，没有回调block时，c的地址一样，当回调block时内外地址不一样，但要注意在block内部可以直接通过地址改变c的值
 4、当对象没有被__block修饰时，可以改变对象固有的属性，但不可以重新赋值
 */
- (void)blockTest2
{
    __block int a = 101;//Variable is not assignable (missing __block type specifier)
    static int b = 201;
    int c = 301;
    MZResponderChainA *responderA = [[MZResponderChainA alloc] init];
    responderA.name = @"responderA";
    NSLog(@"进去之前a的地址:%p",&a);
    NSLog(@"进去之前b的地址:%p",&b);
    NSLog(@"进去之前c的地址:%p",&c);
    
    void(^mzBlock)(void) = ^(void) {
        a = 102;
        b = 202;
        responderA.name = @"responderB";
//        responderA = [[MZResponderChainA alloc] init];//（解说4）
        self.arr = @[@"q",@"w"];
        NSLog(@"block内a的地址:%p",&a);
        NSLog(@"block内b的地址:%p",&b);
        NSLog(@"block内c的地址:%p",&c);
        int *p = (int *)&c;
        MZLog(@(a));
        MZLog(@(b));
        *p = 302;
        MZLog(@(c));//c 和 *p的值一样
        int *pReg;  // 创建一个指针变量
        pReg = (int *)&c;  // 将给定的寄存器地址付给指针
        *pReg = 304;//直接给指定地址赋值
        MZLog(@(c));
        NSLog(@"block内c的地址:%p",pReg);
    };
    a = 103;
    b = 203;
    NSLog(@"进去之后a的地址:%p",&a);
    NSLog(@"进去之后a1的地址:%p",&a);
    NSLog(@"进去之后a2的地址:%p",&a);
    NSLog(@"进去之后b的地址:%p",&b);
    NSLog(@"进去之后c的地址:%p",&c);
    mzBlock();
    
    NSLog(@"进去之后responderA:%@",responderA.name);
    
    self.mzBlock = ^(NSString *m, NSString *n) {

    };

}

- (void)blockTest1
{
    MZBlock block;
    {
        MZResponderChainA *responderA = [[MZResponderChainA alloc] init];
        responderA.name = @"responderA";
        int i = 10; //值传递(值引用只是把值传递到新的变量，修改新的变量，不会修改原来的参数。。)
        static int j = 100;//指针传递
        block = ^(NSString *mz){
            __strong MZResponderChain *strongPersn = responderA;
            MZLog(strongPersn.name);
            int m = i;
            MZLog(@(m));
            MZLog(@(j));
        };
        i = 11;
        j = 101;
        responderA.name = @"responderB";
        
        __weak MZResponderChain *weakPersn = responderA;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            MZLog(weakPersn.name);
        });
        
        block(@"mz");
    };
}

/**
 isEqual与hash
 对于基本类型, ==运算符比较的是值; 对于对象类型, ==运算符比较的是对象的地址(即是否为同一对象)
 hash方法只在对象被添加至NSSet和设置为NSDictionary的key时会调用；对象相等hash值一定一样，hash值相同对象不一定是同一个
 */
- (void)isEqualObject
{
    UIColor *color1 = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:1.0];
    UIColor *color2 = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:1.0];
    //    UIColor *color3 = [UIColor colorWithWhite:0.1 alpha:0.5];
    MZResponderChainA *responderA = [[MZResponderChainA alloc] init];
    responderA.name = @"responderA";
    
    MZResponderChainA *responderB = [[MZResponderChainA alloc] init];
    responderB.name = @"responderA";
    responderB = responderA;
    
    NSLog(@"color1 == color2 = %@", color1 == color2 ? @"YES" : @"NO");
    NSLog(@"[color1 isEqual:color2] = %@", [color1 isEqual:color2] ? @"YES" : @"NO");
    NSLog(@"color1.hash == color2.hash = %@", color1.hash == color2.hash ? @"YES" : @"NO");
    NSLog(@"[responderA isEqual:responderB] = %@", [responderA isEqual:responderB] ? @"YES" : @"NO");
}

@end
