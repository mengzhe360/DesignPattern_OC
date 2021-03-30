//
//  MZAViewController.m
//  设计模式
//
//  Created by A5 on 2020/1/8.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "MZAViewController.h"

#import <objc/runtime.h>
#import <malloc/malloc.h>

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
#import "MZContectTest.h"

#import "MZContextState.h"

#import "MZOriginator.h"
#import "MZCaretaker.h"

#import "MZElementCollection.h"

#import "MZFlyweightFactory.h"
#import "MZConcreteFlyweight.h"

#import "MZBridgeManager.h"
#import "MZApiStatInfo.h"
#import "MZAlert.h"

#import "MZDynamicProtocol.h"
#import "MZDynamicProxy.h"
#import "MZNormalTest.h"
#import "MZNormalObject.h"

#import "MZHMOne.h"
#import "MZHMTwo.h"

#import "MZInvoker.h"
#import "MZCommandA.h"
#import "MZCommandB.h"
#import "MZReceiverA.h"
#import "MZReceiverB.h"

#import "MZMediator.h"
#import "MZColleagueA.h"
#import "MZColleagueB.h"

#import "MZBlockViewController.h"

#import "MZPerson.h"
#import "NSObject+MZ_KVO.h"

#import "MZReusePoolViewController.h"


/*
 创建型设计模式主要解决“对象的创建”问题，
 结构型设计模式主要解决“类或对象的组合或组装”问题，
 行为型设计模式主要解决的就是“类或对象之间的交互”问题。
 创建型模式是将创建和使用代码解耦，结构型模式是将不同功能代码解耦，行为型模式是将不同的行为代码解耦
 */

static NSString *const SCIENCE = @"SCIENCE";
static NSString *const NEWTON =  @"NEWTON";

extern void _objc_autoreleasePoolPrint(void);

typedef void(^MZBlock)(NSString *mz);

@interface MZAViewController ()<MZSubscriptionServiceCenterProtocol>
@property (nonatomic,copy) NSString *mark;
@property (nonatomic,strong) dispatch_semaphore_t semaphore;
@property (nonatomic,strong) MZPerson *person;


@end

@implementation MZAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.greenColor;
    self.navigationItem.title = @"MZA";
    
//    self.mark = @"mark";
//
//    self.semaphore = dispatch_semaphore_create(1);
    [self kvoTest];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
//    MZReusePoolViewController *blockVc = [[MZReusePoolViewController alloc] init];
//
//    [self.navigationController pushViewController:blockVc animated:YES];
    
//    MZBlockViewController *blockVc = [[MZBlockViewController alloc] init];
//    [self.navigationController pushViewController:blockVc animated:YES];

//    dispatch_async(dispatch_get_global_queue(-2,0), ^{
//        @autoreleasepool{
//            for (int i = 0; i < 100; i++) {
//                NSString *str = [[NSString alloc] init];
//            }
//
            
//        }
//        _objc_autoreleasePoolPrint();
      
       
//    });

//    _person.age += 1;
 
}

- (void)kvoTest
{
    _person = [[MZPerson alloc] init];
    _person.a = 1;
    _person.b = 2;
    _person.s = @"ascf";
    
    [_person mz_addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew context:nil];
  
    NSLog(@"%zd",class_getInstanceSize([MZPerson class]));
    NSLog(@"%zd",malloc_size((__bridge const void *)_person));
}

- (void)mz_observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    NSLog(@"change == %@",change);
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
    
    MZResponderChain *responderA = [MZResponderChainA new];
    responderA.name = @"responderA";
    MZResponderChain *responderB = [MZResponderChainB new];
    responderB.name = @"responderB";
    MZResponderChain *responderC = [MZResponderChainC new];
    responderC.name = @"responderC";
    
    responderA.nextResponder = responderB;
    responderB.nextResponder = responderC;
    responderC.nextResponder = responderA;
    
    [responderA handle:^(MZResponderChain * _Nonnull handler, BOOL handled) {
        
        NSLog(@"-5-%@:处理当前业务",handler.name);
        
    }];
    
//    UIViewController *VC = [NSObject objectForClassName:@"MZRouterEventViewController"];
//    [self.navigationController pushViewController:VC animated:YES];
    
}

/// 2、模板模式
- (void)templateMode
{
    MZHMOne *one = [MZHMOne new];
    
    [one setAlarm:NO];
    [one run];
    
    MZHMTwo *two = [MZHMTwo new];
    [two run];
}

/// 3、动态代理
- (void)dynamicProtocol
{
    id vc = [[MZNormalTest alloc] init];
//    id<MZDynamicProtocol> obj = (id)[[MZDynamicProxy alloc] initWithObject:vc];
//    [(MZNormalTest *)vc mzOptionalThing];
    
//    id<MZDynamicProtocol> obj = (id)[[MZNormalObject alloc] init];
    id<MZDynamicProtocol> obj = (id)[[MZDynamicProxy alloc] initWithObject:(id)[[MZNormalObject alloc] init]];

    [obj doSomething];
    [obj doOtherThing];
    [obj optionalThing];
}

- (void)mzTestDelegate
{
    id<MZTestDelegate> mz = (id)[[MZTestDelegateA alloc] init];
    if ([mz respondsToSelector:@selector(mzTestOne)]) {
//        [mz mzTestOne];
//        [mz mzTestTwo];
    }
    
//    id<MZTestDelegate> mz1 = (id)[[MZTestBaseDelegate alloc] init];
//    if ([mz1 respondsToSelector:@selector(mzTestTwo)]) {
//        [mz1 mzTestOne];
//        [mz1 mzTestTwo];
//    }
    
    MZContectTest *test = [[MZContectTest alloc] init];
    test.delegate = mz;
    [test action];
    
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
    NSObject *subjectB = [NSObject objectForClassName:@"MZSubjectClassB"];
    NSObject *observerA = [NSObject objectForClassName:@"MZObserverClassA"];
    NSObject *observerB = [NSObject objectForClassName:@"MZObserverClassB"];
    
    [self performClass:subject selector:@"addObserver:" objects:@[observerA] type:kInstanceMethod];
//    [self performClass:subject selector:@"deleteObserver:" objects:@[observerA] type:kInstanceMethod];
    [self performClass:subject selector:@"addObserver:" objects:@[observerB] type:kInstanceMethod];
    [self performClass:subjectB selector:@"addObserver:" objects:@[observerA] type:kInstanceMethod];
    [self performClass:subject selector:@"doSomething:" objects:@[@"被观察者开始活动了"] type:kInstanceMethod];
    [self performClass:subjectB selector:@"doSomething:" objects:@[@"被观察者开始活动了"] type:kInstanceMethod];
    
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
    layer.frame = CGRectMake(0, 0, 100, 100);
 
    
    UIView *view = [[UIView alloc] init];
    view.frame = CGRectMake(10, 100, 100, 100);
    view.backgroundColor = UIColor.redColor;
    view.layer.frame = CGRectMake(20, 200, 100, 200);
    view.layer.delegate = view;
    
    [self.view addSubview:view];
    view.layer.cornerRadius = 5;
    
    MZTestView *mView = [[MZTestView alloc] init];
    [mView mzDrawRect:@"测试一下代理执行情况"];
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
    [self performClass:contextState selector:@"setCurrentState:" objects:@[_concreteStateB()] type:kInstanceMethod];
    [self performClass:contextState selector:@"contextStateHandleC:" objects:@[@"猪八戒变成如来佛主"] type:kInstanceMethod];
    
//    [self performClass:contextState selector:@"setCurrentState:" objects:@[_concreteStateB()] type:kInstanceMethod];
//    [self performClass:contextState selector:@"contextStateHandleC:" objects:@[@"孙悟空变成小鸟"] type:kInstanceMethod];
//    [self performClass:contextState selector:@"contextStateHandleD:" objects:@[@"孙悟空变成老虎"] type:kInstanceMethod];
//    
}

//10、备忘录模式
- (void)mementoMode
{
    MZLog(@"---------单个状态情况---------")
    //1、实例化发起人
    MZOriginator *originator = [NSObject objectForClassName:@"MZOriginator"];
    originator.name = @"中国民主繁盛富强-A";

    //2、实例化备忘录管理
    MZCaretaker *caretaker = [NSObject objectForClassName:@"MZCaretaker"];

    //3、创建备忘录
    caretaker.memento = [originator createMemento];

    originator.name = @"中国民主繁盛富强-B";

    //5、恢复备忘录
    [originator restoreMemento:caretaker.memento];
    
    MZLog(@"--------多个个状态情况----------")
    
    //1、实例化发起人
    MZOriginator *originatorM = [NSObject objectForClassName:@"MZOriginator"];

    //2、实例化备忘录管理
    MZCaretaker *caretakerM = [NSObject objectForClassName:@"MZCaretaker"];

    //3、创建备忘录
    caretakerM.memento = [originatorM createMemento];

    originatorM.name = @"中国民主繁盛富强AAA";
    originatorM.nameA = @"中国就是强";
    [originatorM setState:@"AAA"];

    originatorM.name = @"中国民主繁盛富强BBB";
    originatorM.nameB = @"中国第一";
    [originatorM setState:@"BBB"];

    originatorM.name = @"中国民主繁盛富强CCC";
    originatorM.nameA = @"中国打败小日本";
    originatorM.nameB = @"中国打败美国佬";
    [originatorM setState:@"CCC"];

    originatorM.name = @"中国民主繁盛富强DDD";
    [originatorM setState:@"DDD"];

    //5、恢复备忘录
    [originatorM restoreMemento:caretakerM.memento atState:@"BBB"];

}

//11、访问者模式
- (void)visitorMode
{

    MZElementCollection *collection = [NSObject objectForClassName:@"MZElementCollection"];
    NSObject *elementA = [NSObject objectForClassName:@"MZElementA"];
    NSObject *elementB = [NSObject objectForClassName:@"MZElementB"];
    [self performClass:collection selector:@"addElement:withKey:" objects:@[elementA,@"ElementA"] type:kInstanceMethod];
    [self performClass:collection selector:@"addElement:withKey:" objects:@[elementB,@"ElementB"] type:kInstanceMethod];
    
    [collection.allKeys enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        id <MZElementProtocol> element = [collection elementWithKey:obj];
        NSObject *visitorA = [NSObject objectForClassName:@"MZVisitorA"];
        NSObject *visitorB = [NSObject objectForClassName:@"MZVisitorB"];
        
        [self performClass:element selector:@"accept:" objects:@[visitorA] type:kInstanceMethod];
        [self performClass:element selector:@"accept:" objects:@[visitorB] type:kInstanceMethod];
        
    }];
    
}

//12、享元模式
- (void)flyweightMode
{
    MZFlyweightFactory *factory = [[MZFlyweightFactory alloc] init];
    MZConcreteFlyweight *faA = [factory getFlyweight:@"外部A"];
    [faA operate:@"业务逻辑A"];
    MZConcreteFlyweight *faB = [factory getFlyweight:@"外部B"];
    [faB operate:@"业务逻辑B"];
    MZConcreteFlyweight *faC = [factory getFlyweight:@"外部C"];
    [faC operate:@"业务逻辑C"];
    MZConcreteFlyweight *faD = [factory getFlyweight:@"外部D"];
    [faD operate:@"业务逻辑D"];
    
    MZConcreteFlyweight *fa1 = [factory getFlyweight:@"外部A"];
    [fa1 operate:@"业务逻辑A"];
    MZConcreteFlyweight *fa2 = [factory getFlyweight:@"外部B"];
    [fa2 operate:@"业务逻辑B"];
    MZConcreteFlyweight *fa3 = [factory getFlyweight:@"外部C"];
    [fa3 operate:@"业务逻辑C"];
    MZConcreteFlyweight *fa4 = [factory getFlyweight:@"外部D"];
    [fa4 operate:@"业务逻辑D"];
    
    [factory getFlyweightCount];    
}

//13、桥接模式
- (void)bridgingMode
{

    MZApiStatInfo *info = [[MZApiStatInfo alloc] init];
    info.api = @"http";
    info.requestCount = 20;
    info.errorCount = 8;
    info.durationSeconds = 10;
    
    [[[MZBridgeManager sharedInstance] getAlert] alertCheck:info];
}

//14、命令模式
- (void)commandMode
{
    id<MZReceiverProtocol> receiver = [[MZReceiverA alloc] init];
    MZBaseCommand *cmd = [[MZCommandA alloc] initWithReceiver:receiver];
    [MZInvoker executeCommand:cmd completion:^(MZBaseCommand * _Nonnull cmd) {
        [MZInvoker cancelCommand:cmd];
    }];
    
    [MZInvoker cancelCommand:cmd];
    
    id<MZReceiverProtocol> receiverB = [[MZReceiverB alloc] init];
    [cmd setReceiver:receiverB];//变换命令执行人
    [MZInvoker executeCommand:cmd completion:^(MZBaseCommand * _Nonnull cmd) {
        
    }];
}

/// 中介者模式
- (void)mediatorMode
{
    MZMediator *med = [[MZMediator alloc] init];
    MZBaseColleague *colA = [[MZColleagueA alloc] initWithMediator:med];
    MZBaseColleague *colB = [[MZColleagueB alloc] initWithMediator:med];
    
    [colA notify:@"通知去买香蕉"];
    [colB notify:@"通知去买西瓜"];
}

@end
