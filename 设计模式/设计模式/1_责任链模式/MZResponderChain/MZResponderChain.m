//
//  MZResponderChain.m
//  设计模式
//
//  Created by 孟哲 on 2020/1/7.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "MZResponderChain.h"

@implementation MZResponderChain

// 责任链入口方法
- (void)handle:(ResultBlock)result
{
    CompletionBlock completion = ^(BOOL handled){
        
        if (handled) {
            NSLog(@"-1-%@:可以处理掉了当前业务，上抛结果",self.name);
            result(self, handled);
        } else{
            
            if (self.nextResponder) {
                
                NSLog(@"-2-沿着责任链，指派给下一个:%@处理业务",self.nextResponder.name);
                [self.nextResponder handle:result];
                
            }else{
            
                result(nil, NO);
                NSLog(@"-4-没有业务处理");
                
            }
        }
    };
    
    // 当前业务进行处理
    [self handleResponder:self completion:completion];
}

- (void)handleResponder:(MZResponderChain *)responder completion:(CompletionBlock)completion
{
    /*
     业务逻辑处理
     如网络请求、本地照片查询等
     */
     
    if ([responder.name isEqualToString:@"responder8"]) {
        if (completion) {
            NSLog(@"-3-%@:能处理业务逻辑",responder.name);
            completion(YES);
        }
    }else{
        if (completion) {
            NSLog(@"-3-%@:不能处理业务逻辑",responder.name);
            completion(NO);
        }
    }


}

- (HandleLevel)getHandleLevel
{
    return 0;
}

@end
