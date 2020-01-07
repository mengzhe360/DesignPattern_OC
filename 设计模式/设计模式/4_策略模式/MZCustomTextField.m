//
//  MZCustomTextField.m
//  单例释放
//
//  Created by 孟哲 on 2019/1/25.
//  Copyright © 2019 mengzhe. All rights reserved.
//

#import "MZCustomTextField.h"


@implementation MZCustomTextField

- (BOOL)validate {
    
    BOOL result = [self.inputValidateManager validateInputTextField:self];
    if (result) {
        NSLog(@"-输入正确--%@",self.inputValidateManager.attributeInputStr);
    }else{
        NSLog(@"-输入错误--%@",self.inputValidateManager.attributeInputStr);
    }
    return result;
    
}

- (void)setInputValidateManager:(MZInputValidator *)inputValidateManager
{
     _inputValidateManager = inputValidateManager;
}


@end
