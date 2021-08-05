//
//  MZCommandProtocol.h
//  设计模式
//
//  Created by A5 on 2020/5/14.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MZCommandProtocol <NSObject>

- (void)execute;

- (void)cancel;

- (void)done;

@end

NS_ASSUME_NONNULL_END
