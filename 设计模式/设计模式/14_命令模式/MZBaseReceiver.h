//
//  MZBaseReceiver.h
//  设计模式
//
//  Created by A5 on 2020/5/14.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MZReceiverProtocol.h"

//选择命令执行人去执行不同的命令，处理命令业务逻辑

NS_ASSUME_NONNULL_BEGIN

@interface MZBaseReceiver : NSObject<MZReceiverProtocol>

@end

NS_ASSUME_NONNULL_END
