//
//  MZNode.h
//  设计模式
//
//  Created by 孟哲 on 2021/5/10.
//  Copyright © 2021 孟哲. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MZNode : NSObject

@property (nonatomic,assign) int valve;
@property (nonatomic,strong) MZNode *next;

@end

NS_ASSUME_NONNULL_END
