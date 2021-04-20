//
//  MZPerson.h
//  设计模式
//
//  Created by A5 on 2020/9/9.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MZPerson : NSObject <NSCopying>

@property (nonatomic,assign) int age;
@property (nonatomic,assign) int a;
@property (nonatomic,copy) NSString *s;
@property (nonatomic,assign) int b;
@property (nonatomic,copy) NSString *firstName;
@property (nonatomic,copy) NSString *lastName;

- (BOOL)isEqual:(id)object;

@end

NS_ASSUME_NONNULL_END
