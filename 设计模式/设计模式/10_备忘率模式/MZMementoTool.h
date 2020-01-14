//
//  MZMementoTool.h
//  设计模式
//
//  Created by A5 on 2020/1/14.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MZMementoTool : NSObject

//原始的存储的状态数据
+ (NSDictionary *)backupProp:(id)object;

//恢复到原始的状态
+ (void)restoreProp:(id)object map:(NSDictionary *)map;

@end

NS_ASSUME_NONNULL_END
