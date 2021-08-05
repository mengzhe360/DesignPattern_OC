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

@interface MZBlockViewController (){
    BOOL _isBlock;
}

@property(nonatomic,strong)NSArray *arr;
@property(nonatomic,strong)NSMutableArray *mutArray;
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
    
//    [self isEqualObject];
    
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
 5、如果在block内部存在多线程环境访问self，当block为属性时，内部成员变量要用__strong修饰，防止立即释放和循环引用造成内存泄漏
 6、block不会造成循环引用的情况
    （1）block作为参数也不会造成循环引用
    （2）block并不是属性值，而是临时变量时，不会造成循环引用，因为 self 没有持有 block
    （3）block在栈区也不会造成循环引用
 7、GCD
    （1）在使用block时，如果block内部需要访问self的方法、属性、或者实例变量应当使用weakSelf
    （2）如果在block内需要多次访问self，则需要使用strongSelf
    （3）如果在block内部存在多线程环境访问self，则需要使用strongSelf
    （4）block本身不存在多线程之分，block执行是否是多线程，取决于当前的持有者是否是以多线程的方式来调用它。
 8、block代码块的生命周期
    （1）当block是作为参数传过来的，在这个方法没有执行完，block是一直存在的
    （2）当block作为该类的属性或者成员变量，这样block的生命周期就和实例的生命周期一样了，当然这中情况下就要考虑block会不会持有对象了，可能会造成循环引用或者对象的延迟释放
     疑问，为什么block所在的类都释放了，当前的block代码块还能存在
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
    __weak typeof(self) weakself = self;
    self.mzBlock = ^(NSString *m, NSString *n) {
        //使用__weak，也会有一个隐患，在block内部如果调用了延时函数，当前对象被回收了还使用弱指针指着被销毁的对象(野指针)时会造成崩溃，为了保证在block内的对象不会被释放，我们添加__strong
        MZBlockViewController __strong *strongself = weakself;
//        iOS的GCD中如何关闭或者杀死一个还没执行完的后台线程?
        if(!strongself) return;//防止释放后崩溃
        strongself->_isBlock = YES;
//        weakself->_isBlock = NO;//会被立即释放
//        self->_isBlock = NO;//会造成循环引用
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
 局部 block 会释放造成回调失败
 */
- (void)blockTest:(BOOL)isgo
{
    
    void (^blockName)(void);
    
    if (isgo) {
        
        blockName = [^{
            NSLog(@"blockName-A");
        } copy];
        
    }else{
        
        blockName = ^{
            NSLog(@"blockName-B");
        };
    }
    
    blockName();
    
}

- (void)dealloc{
    NSLog(@"%s",__func__);
}


@end
