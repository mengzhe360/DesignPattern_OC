//
//  MZNumericInputValidator.m
//  单例释放
//
//  Created by 孟哲 on 2019/1/25.
//  Copyright © 2019 mengzhe. All rights reserved.
//

#import "MZNumericInputValidator.h"

@implementation MZNumericInputValidator

- (BOOL)validateInputTextField:(UITextField *)textField {
    
    if (textField.text.length == 0) {
        self.attributeInputStr = @"数值不能是空的";
        return nil;
    }
    // ^[a-zA-Z]*$ 从开头(^)到结尾($), 有效字符集([a-zA-Z])或者更多(*)个字符
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"^[0-9]*$" options:NSRegularExpressionAnchorsMatchLines error:nil];
    NSUInteger numberOfMatches = [regex numberOfMatchesInString:[textField text] options:NSMatchingAnchored range:NSMakeRange(0, [[textField text] length])];
    
    // 进行判断,匹配不符合表示0的话, 就走下面的逻辑
    if (numberOfMatches == 0) {
        self.attributeInputStr = @"输入有误,不全是数字,请重新输入";
        return NO;
    } else {
        self.attributeInputStr = @"输入正确,全部是字母";
        return YES;
    }
    
}

@end
