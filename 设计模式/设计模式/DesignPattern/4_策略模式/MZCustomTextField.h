//
//  MZCustomTextField.h
//  单例释放
//
//  Created by 孟哲 on 2019/1/25.
//  Copyright © 2019 mengzhe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MZInputValidator.h"

NS_ASSUME_NONNULL_BEGIN

@interface MZCustomTextField : UITextField

// 抽象的策略
@property (nonatomic, strong) MZInputValidator *inputValidateManager;

// 验证是否符合要求
- (BOOL)validate;

@end

NS_ASSUME_NONNULL_END
