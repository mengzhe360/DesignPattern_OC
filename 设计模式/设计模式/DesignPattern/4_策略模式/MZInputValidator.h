//
//  MZInputValidator.h
//  单例释放
//
//  Created by 孟哲 on 2019/1/25.
//  Copyright © 2019 mengzhe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MZInputValidator : NSObject

@property(nonatomic,copy)NSString *attributeInputStr; /* 属性字符串 */

- (BOOL)validateInputTextField:(UITextField *)textField;

@end

NS_ASSUME_NONNULL_END
