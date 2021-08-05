//
//  MZElementB.h
//  设计模式
//
//  Created by A5 on 2020/1/15.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MZElementProtocol.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger,MZElementBType) {
    kElementBTypeA = 1,
    kElementBTypeB = 2,
};

@interface MZElementB : NSObject<MZElementProtocol>

@property (nonatomic,copy) NSString *nameB; 

- (void)elementBSpecialOperationB:(MZElementBType)type;

@end

NS_ASSUME_NONNULL_END
