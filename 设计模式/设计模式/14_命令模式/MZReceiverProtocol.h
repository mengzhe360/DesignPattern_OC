//
//  MZReceiverProtocol.h
//  设计模式
//
//  Created by A5 on 2020/5/14.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MZReceiverProtocol <NSObject>

- (void)doSometing:(NSString *)action;

@end

NS_ASSUME_NONNULL_END
