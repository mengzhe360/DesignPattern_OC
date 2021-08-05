//
//  UIResponder+MZRouter.m
//  设计模式
//
//  Created by A5 on 2020/1/9.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "UIResponder+MZRouter.h"

@implementation UIResponder (MZRouter)

- (void)routerEventWithSelectorName:(NSString *)selectorName
                             object:(id)object
                           userInfo:(NSDictionary *)userInfo {
    
    [[self nextResponder] routerEventWithSelectorName:selectorName
                                       object:object
                                     userInfo:userInfo];
    
}

@end
