//
//  UIResponder+MZRouter.h
//  设计模式
//
//  Created by A5 on 2020/1/9.
//  Copyright © 2020 孟哲. All rights reserved.
//
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIResponder (MZRouter)

- (void)routerEventWithSelectorName:(NSString *)selectorName
                             object:(id)object
                           userInfo:(NSDictionary *)userInfo;

@end

NS_ASSUME_NONNULL_END
