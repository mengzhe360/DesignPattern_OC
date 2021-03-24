//
//  MZStudent.h
//  设计模式
//
//  Created by A5 on 2020/9/9.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^MZStudentBlock)(void);

@protocol MZStudentDelegate <NSObject>

@optional
- (void)opTest;

@required
- (void)reTest;

@end

@interface MZStudent : NSObject

@property (nonatomic,copy) NSString *name;
@property (nonatomic,weak) id<MZStudentDelegate> delegate;
@property (nonatomic,copy) MZStudentBlock block;

- (void)textMethod;

@end


NS_ASSUME_NONNULL_END
