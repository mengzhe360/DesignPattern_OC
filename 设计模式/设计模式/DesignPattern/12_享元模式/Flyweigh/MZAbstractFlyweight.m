//
//  MZAbstractFlyweight.m
//  设计模式
//
//  Created by A5 on 2020/1/17.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "MZAbstractFlyweight.h"

@interface MZAbstractFlyweight ()

@property (nonatomic,strong) NSString *extrinsic;

@end

@implementation MZAbstractFlyweight

- (instancetype)initWithExtrinsic:(NSString *)extrinsic
{
    self = [super init];
    if (self) {
        self.extrinsic = extrinsic;
    }
    return self;
}

- (void)operate:(NSString *)extrinsic
{
    AbstractMethodNotImplemented();
}

@end
