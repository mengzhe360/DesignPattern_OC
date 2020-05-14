//
//  MZBaseCommand.m
//  设计模式
//
//  Created by A5 on 2020/5/14.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "MZBaseCommand.h"
#import "MZBaseReceiver.h"
#import "MZInvoker.h"

@implementation MZBaseCommand

- (instancetype)initWithReceiver:(MZBaseReceiver *)receiver
{
    self = [super init];
    if (self) {
        self.receiver  = receiver;
    }
    return self;
}

- (void)execute
{
    
}

- (void)cancel{
    
    self.completion = nil;
}

- (void)done
{
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if (self.completion) {
            self.completion(self);
        }
        
        //释放
        self.completion = nil;
        
        [[MZInvoker sharedInstance].arrayCommands removeObject:self];
    });
}

- (void)setReceiver:(MZBaseReceiver *)receiver
{
    _receiver = receiver;
}

@end
