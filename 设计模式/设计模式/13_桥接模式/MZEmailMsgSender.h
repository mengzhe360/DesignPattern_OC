//
//  MZEmailMsgSender.h
//  设计模式
//
//  Created by 孟哲 on 2020/2/28.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MZMsgSenderProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface MZEmailMsgSender : NSObject<MZMsgSenderProtocol>

@property (nonatomic,strong) NSArray *emails;

@end

NS_ASSUME_NONNULL_END
