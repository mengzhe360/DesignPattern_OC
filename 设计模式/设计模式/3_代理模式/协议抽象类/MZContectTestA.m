//
//  MZContectTestA.m
//  设计模式
//
//  Created by A5 on 2020/5/28.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "MZContectTestA.h"
#import "MZTestDelegate.h"
#import "MZTestDelegateA.h"
#import "MZTestDelegateB.h"

@implementation MZContectTestA

- (void)action
{
     id<MZTestDelegate> mz = (id)[[MZTestDelegateA alloc] init];
   //    if ([mz respondsToSelector:@selector(mzTestOne)]) {
   //        [mz mzTestOne];
   //        [mz mzTestTwo];
   //    }
       
       id<MZTestDelegate> mz1 = (id)[[MZTestBaseDelegate alloc] init];
   //    if ([mz1 respondsToSelector:@selector(mzTestTwo)]) {
   //        [mz1 mzTestOne];
   //        [mz1 mzTestTwo];
   //    }
       
       MZContectTest *test = [[MZContectTest alloc] init];
       test.delegate = mz1;
       [test action];
}

@end
