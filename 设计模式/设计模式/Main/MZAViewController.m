//
//  MZAViewController.m
//  设计模式
//
//  Created by A5 on 2020/1/8.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "MZAViewController.h"
#import "MZStrategyViewController.h"
#import "MZResponderChain.h"
#import "MZResponderChainA.h"
#import "MZResponderChainB.h"
#import "MZResponderChainC.h"
#import "MZSubscriptionServiceCenterProtocol.h"
#import "MZSubscriptionServiceCenter.h"

#import "MZComposite.h"
#import "MZLeaf.h"

#import "MZUIView.h"
#import "MZCALayer.h"
#import "MZTestView.h"

#import "MZTestDelegate.h"
#import "MZTestDelegateA.h"
#import "MZTestDelegateB.h"

#import "MZContextState.h"

#import "MZOriginator.h"
#import "MZCaretaker.h"

#define  SCIENCE  @"SCIENCE"
#define  NEWTON   @"NEWTON"

typedef void(^MZBlock)(NSString *mz);

@interface MZAViewController ()<MZSubscriptionServiceCenterProtocol>

@end

@implementation MZAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.greenColor;
    self.navigationItem.title = @"MZA";
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self mementoMode];
}

///1_责任链
- (void)responderChain
{
    
    //    NSMutableArray <MZResponderChain*> *responderMArr = [NSMutableArray new];
    //
    //    for (int i = 0; i < 10; i++) {
    //        MZResponderChain *responder = [MZResponderChain new];
    //        responder.name = [NSString stringWithFormat:@"responder%d",i];
    //        [responderMArr addObject:responder];
    //    }
    //
    //    [responderMArr enumerateObjectsUsingBlock:^(MZResponderChain * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
    //
    //        if (idx < responderMArr.count-1) {
    //            obj.nextResponder = responderMArr.copy[idx + 1];
    //        }
    //
    //    }];
    //
    //    [responderMArr[0] handle:^(MZResponderChain * _Nonnull handler, BOOL handled) {
    //
    //        NSLog(@"-5-%@:处理当前业务",handler.name);
    //
    //    }];
    
    //    MZResponderChain *responderA = [MZResponderChainA new];
    //    responderA.name = @"responderA";
    //    MZResponderChain *responderB = [MZResponderChainB new];
    //    responderB.name = @"responderB";
    //    MZResponderChain *responderC = [MZResponderChainC new];
    //    responderC.name = @"responderC";
    //
    //    responderA.nextResponder = responderB;
    //    responderB.nextResponder = responderC;
    //    responderC.nextResponder = responderA;
    //
    //    [responderA handle:^(MZResponderChain * _Nonnull handler, BOOL handled) {
    //
    //         NSLog(@"-5-%@:处理当前业务",handler.name);
    //
    //    }];
    
    UIViewController *VC = [NSObject objectForClassName:@"MZRouterEventViewController"];
    [self.navigationController pushViewController:VC animated:YES];
    
}

/// 4_策略模式
- (void)strategyMode
{
    UIViewController *VC = [NSObject objectForClassName:@"MZStrategyViewController"];
    [self.navigationController pushViewController:VC animated:YES];
}

/// 4_NSObject+MZPerformSelector 调用
- (void)mztest:(NSString *)mz callBlock:(MZBlock)block
{
    if (mz && block) {
        NSLog(@"%@",mz);
        block(@"perform测试-回调");
    }
}

/// 6、观察者模式
- (void)observerMode
{
    NSObject *subject = [NSObject objectForClassName:@"MZSubjectClassA"];
    NSObject *observerA = [NSObject objectForClassName:@"MZObserverClassA"];
    NSObject *observerB = [NSObject objectForClassName:@"MZObserverClassB"];
    
    [self performClass:subject selector:@"addObserver:" objects:@[observerA] type:kInstanceMethod];
    [self performClass:subject selector:@"addObserver:" objects:@[observerB] type:kInstanceMethod];
    [self performClass:subject selector:@"deleteObserver:" objects:@[observerA] type:kInstanceMethod];
    [self performClass:subject selector:@"addObserver:" objects:@[observerA] type:kInstanceMethod];
    [self performClass:subject selector:@"addObserver:" objects:@[observerB] type:kInstanceMethod];
    [self performClass:subject selector:@"doSomething:" objects:@[@"被观察者开始活动了"] type:kInstanceMethod];
    
    // 创建订阅号 - SCIENCE NEWTON
    [MZSubscriptionServiceCenter createSubscriptionNumber:SCIENCE];
    [MZSubscriptionServiceCenter createSubscriptionNumber:NEWTON];
    
    // 客户添加了订阅号 - SCIENCE NEWTON
    id mzcVc = [NSObject objectForClassName:@"MZCViewController"];
    [MZSubscriptionServiceCenter addCustomer:self withSubscriptionNumber:SCIENCE];
    [MZSubscriptionServiceCenter addCustomer:self withSubscriptionNumber:NEWTON];
    [MZSubscriptionServiceCenter addCustomer:mzcVc withSubscriptionNumber:SCIENCE];
    [MZSubscriptionServiceCenter addCustomer:mzcVc withSubscriptionNumber:NEWTON];
    //    [MZSubscriptionServiceCenter removeCustomer:self fromSubscriptionNumber:SCIENCE];
    //    [MZSubscriptionServiceCenter removeSubscriptionNumber:NEWTON];
    
    // 订阅中心给订阅号 - SCIENCE NEWTON 发送订阅信息
    [MZSubscriptionServiceCenter sendMessage:@"爱因斯坦" toSubscriptionNumber:SCIENCE];
    [MZSubscriptionServiceCenter sendMessage:@"小苹果" toSubscriptionNumber:NEWTON];
    
}

- (void)subscriptionMessage:(id)message subscriptionNumber:(NSString *)subscriptionNumber
{
    if ([subscriptionNumber isEqualToString:NEWTON]) {
        
        NSLog(@"MZAViewController-来自于牛顿杂志的信息 - %@", message);
        
    } else if ([subscriptionNumber isEqualToString:SCIENCE]) {
        
        NSLog(@"MZAViewController-来自于科学美国人杂志的信息 - %@", message);
    }
}

//7、组合模式
- (void)componentMode
{
    MZComposite *root = [[MZComposite alloc] init];
    root.name = @"总经理";
    
    MZComposite *branchA = [[MZComposite alloc] init];
    branchA.name = @"技术部经理";
    
    MZComposite *branchAa = [[MZComposite alloc] init];
    branchAa.name = @"技术部经理Aa";
    
    MZComposite *branchB = [[MZComposite alloc] init];
    branchB.name = @"产品部经理";
    
    MZLeaf *leafA = [[MZLeaf alloc] init];
    leafA.name = @"技术部A";
    MZLeaf *leafB = [[MZLeaf alloc] init];
    leafB.name = @"技术部B";
    MZLeaf *leafAa = [[MZLeaf alloc] init];
    leafAa.name = @"技术部Aa";
    MZLeaf *leafC = [[MZLeaf alloc] init];
    leafC.name = @"产品部C";
    
    [root add:branchA];
    [root add:branchB];
    
    [branchA add:branchAa];
    [branchAa add:leafAa];
    [branchA add:leafA];
    [branchA add:leafB];
    [branchB add:leafC];
    
    //递归遍历
    [self displayComposite:root];
    
}

- (void)displayComposite:(MZComposite *)root
{
    [root operationSomething];//每一层遍历
    
    [root.getChildren enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:MZLeaf.class]) {
            MZLeaf *leaf = (MZLeaf *)obj;
            [leaf operationSomething];
        }else{
            [self displayComposite:obj];
        }
    }];
}

//8、UIView和CALayer
- (void)viewLayerTest
{
    CALayer * layer = [[CALayer alloc] init];
    CALayer * layer1 = [[CALayer alloc] init];
    CALayer * layer2 = [[CALayer alloc] init];
    layer.frame = CGRectMake(0, 0, 100, 100);
    [layer addSublayer:layer1];
    [layer addSublayer:layer2];
    
    UIView *view = [[UIView alloc] init];
    UIView *view1 = [[UIView alloc] init];
    UIView *view2 = [[UIView alloc] init];
    UIView *view3 = [[UIView alloc] init];
    
    view.frame = CGRectMake(10, 100, 100, 100);
    view.backgroundColor = UIColor.redColor;
    view.layer.frame = CGRectMake(20, 200, 100, 200);
    view.layer.delegate = view;
    
    [self.view addSubview:view];
    [view addSubview:view1];
    [view addSubview:view2];
    [view addSubview:view3];
    view.layer.cornerRadius = 5;
    
    MZTestView *mView = [[MZTestView alloc] init];
    [mView mzDrawRect:@"测试一下代理执行情况"];
}

- (void)mzTestDelegate
{
    id<MZTestDelegate> mz = (id)[[MZTestDelegateA alloc] init];
    if ([mz respondsToSelector:@selector(mzTestOne)]) {
        [mz mzTestOne];
        [mz mzTestTwo];
    }
    
    id<MZTestDelegate> mz1 = (id)[[MZTestDelegateB alloc] init];
    if ([mz1 respondsToSelector:@selector(mzTestTwo)]) {
        [mz1 mzTestOne];
        [mz1 mzTestTwo];
    }
}

//8、门面模式
- (void)facadeMode
{
    [self performClassName:@"MZFacadeA" selector:@"facadeAMethodA" objects:@[] type:kInstanceMethod];
    [self performClassName:@"MZFacadeA" selector:@"facadeAmethodB" objects:@[] type:kInstanceMethod];
    [self performClassName:@"MZFacadeA" selector:@"facadeAmethodC" objects:@[] type:kInstanceMethod];
    [self performClassName:@"MZFacadeB" selector:@"facadeBmethodD" objects:@[] type:kInstanceMethod];
    
}

//9、状态模式
- (void)stateMode
{
    
    NSObject *contextState = [NSObject objectForClassName:@"MZContextState"];
    //    NSObject *stateA = [NSObject objectForClassName:@"MZConcreteStateA"];
    //    NSObject *stateB = [NSObject objectForClassName:@"MZConcreteStateB"];
    
    [self performClass:contextState selector:@"setCurrentState:" objects:@[_concreteStateA()] type:kInstanceMethod];
    [self performClass:contextState selector:@"contextStateHandleC:" objects:@[@"猪八戒变成一条龙"] type:kInstanceMethod];
    [self performClass:contextState selector:@"contextStateHandleD:" objects:@[@"猪八戒变成如来佛主"] type:kInstanceMethod];
    
    [self performClass:contextState selector:@"setCurrentState:" objects:@[_concreteStateB()] type:kInstanceMethod];
    [self performClass:contextState selector:@"contextStateHandleC:" objects:@[@"孙悟空变成小鸟"] type:kInstanceMethod];
    [self performClass:contextState selector:@"contextStateHandleD:" objects:@[@"孙悟空变成老虎"] type:kInstanceMethod];
    
}

//10、备忘录模式
- (void)mementoMode
{
    
    //    //1、实例化发起人
    //    MZOriginator *originator = [NSObject objectForClassName:@"MZOriginator"];
    //    originator.name = @"中国民主繁盛富强-A";
    //
    //    //2、实例化备忘录管理
    //    MZCaretaker *caretaker = [NSObject objectForClassName:@"MZCaretaker"];
    //
    //    //3、创建备忘录
    //    caretaker.memento = [originator createMemento];
    //
    //    originator.name = @"中国民主繁盛富强-B";
    //
    //    //5、恢复备忘录
    //    [originator restoreMemento:caretaker.memento];
    
    
    //1、实例化发起人
    MZOriginator *originator = [NSObject objectForClassName:@"MZOriginator"];
    
    //2、实例化备忘录管理
    MZCaretaker *caretaker = [NSObject objectForClassName:@"MZCaretaker"];
    
    //3、创建备忘录
    caretaker.memento = [originator createMemento];
    
    originator.name = @"中国民主繁盛富强AAA";
    originator.nameA = @"中国就是强";
    [originator setState:@"AAA"];
    
    originator.name = @"中国民主繁盛富强BBB";
    originator.nameB = @"中国第一";
    [originator setState:@"BBB"];
    
    originator.name = @"中国民主繁盛富强CCC";
    originator.nameA = @"中国打败小日本";
    originator.nameB = @"中国打败美国佬";
    [originator setState:@"CCC"];
    
    originator.name = @"中国民主繁盛富强DDD";
    [originator setState:@"DDD"];

    //5、恢复备忘录
    [originator restoreMemento:caretaker.memento atState:@"DDD"];
    
}


@end
