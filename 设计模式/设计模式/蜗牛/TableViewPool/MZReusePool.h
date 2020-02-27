//
//  MZReusePool.h
//  设计模式
//
//  Created by 孟哲 on 2020/2/27.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MZReusePool : NSObject

// 从重用池当中取出一个可重用的view
- (UIView *)dequeueReusableView;

// 向重用池当中添加一个视图
- (void)addUsingView:(UIView *)view;

// 重置方法，将当前使用中的视图移动到可重用队列当中
- (void)reset;

@end

NS_ASSUME_NONNULL_END
