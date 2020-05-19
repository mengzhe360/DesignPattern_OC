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

@end

@implementation MZBlockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.orangeColor;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
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
 */
- (void)isEqualObject
{
    UIColor *color1 = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:1.0];
    UIColor *color2 = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:1.0];
    UIColor *color3 = [UIColor colorWithWhite:0.1 alpha:0.5];
    NSLog(@"color1 == color2 = %@", color1 == color2 ? @"YES" : @"NO");
    NSLog(@"[color1 isEqual:color2] = %@", [color1 isEqual:color2] ? @"YES" : @"NO");
}

@end
