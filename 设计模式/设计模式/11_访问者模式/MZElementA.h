//
//  MZElementA.h
//  设计模式
//
//  Created by A5 on 2020/1/15.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MZElementProtocol.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger,MZElementAType) {
    kElementATypeA = 1,
    kElementATypeB = 2,
};

@interface MZElementA : NSObject<MZElementProtocol>

@property (nonatomic,copy) NSString *nameA; 

- (void)elementASpecialOperationA:(MZElementAType)type;

@end

NS_ASSUME_NONNULL_END
