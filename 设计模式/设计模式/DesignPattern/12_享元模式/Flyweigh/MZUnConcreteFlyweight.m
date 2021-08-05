//
//  MZUnConcreteFlyweight.m
//  设计模式
//
//  Created by A5 on 2020/1/17.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "MZUnConcreteFlyweight.h"

@implementation MZUnConcreteFlyweight

- (instancetype)initWithExtrinsic:(NSString *)extrinsic
{
    self = [super initWithExtrinsic:extrinsic];
    if (self) {
       
    }
    return self;
}

- (void)operate:(NSString *)extrinsic
{
    MZLog(extrinsic)
}

@end
