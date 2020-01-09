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

typedef void(^MZBlock)(NSString *mz);

@interface MZAViewController ()

@end

@implementation MZAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.greenColor;
    self.navigationItem.title = @"MZA";
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self responderChain];
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
    
 
}

/// 4_策略模式
- (void)strategyMode
{
    MZStrategyViewController *VC = [[MZStrategyViewController alloc] init];
//    struct mj_objc_class *cls = (__bridge struct mj_objc_class *)[MZStrategyViewController class];
    [self.navigationController pushViewController:VC animated:YES];
}

/// NSObject+MZPerformSelector 调用
+ (void)mztest:(NSString *)mz callBlock:(MZBlock)block
{
    if (mz && block) {
        NSLog(@"%@",mz);
        block(@"perform测试-回调");
    }
}

@end
