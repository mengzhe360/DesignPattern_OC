//
//  MZInvoker.h
//  设计模式
//
//  Created by A5 on 2020/5/14.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MZBaseCommand.h"

NS_ASSUME_NONNULL_BEGIN

//接受指令 ，分配执行人执行

@interface MZInvoker : NSObject

@property (nonatomic, strong) NSMutableArray <MZBaseCommand *> *arrayCommands;

+ (instancetype)sharedInstance;

+ (void)executeCommand:(MZBaseCommand *)cmd completion:(CommandCompletionCallBack)completion;

+ (void)cancelCommand:(MZBaseCommand *)cmd;

@end

NS_ASSUME_NONNULL_END
