//
//  MZAbstarctManager.m
//  设计模式
//
//  Created by 孟哲 on 2020/1/8.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "MZAbstarctManager.h"

@implementation MZAbstarctManager

+ (instancetype)sharedInstance
{
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

// 空的垃圾机制方法
- (void)emptySpamMessages:(NSArray *)parameter withString:(NSString *)str{
    NSLog(@"处理垃圾消息parameter：%@\nstr:%@\n",parameter,str);
}

@end
