//
//  MZBaseCommand.h
//  设计模式
//
//  Created by A5 on 2020/5/14.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MZCommandProtocol.h"

NS_ASSUME_NONNULL_BEGIN

//命令集合

@class MZBaseCommand,MZBaseReceiver;

typedef void(^CommandCompletionCallBack)(MZBaseCommand *cmd);

@interface MZBaseCommand : NSObject<MZCommandProtocol>

- (instancetype)initWithReceiver:(MZBaseReceiver*)receiver;

@property (nonatomic,strong) MZBaseReceiver *receiver;

@property (nonatomic,copy) CommandCompletionCallBack completion;

@end

NS_ASSUME_NONNULL_END
