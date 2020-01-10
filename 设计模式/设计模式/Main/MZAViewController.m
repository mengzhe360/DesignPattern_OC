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
    [self observerMode];
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

@end
