//
//  MZCustomTextField.m
//  单例释放
//
//  Created by 孟哲 on 2019/1/25.
//  Copyright © 2019 mengzhe. All rights reserved.
//

#import "MZCustomTextField.h"

@implementation MZCustomTextField

- (void)setInputValidateManager:(MZInputValidator *)inputValidateManager
{
     _inputValidateManager = inputValidateManager;
}

- (BOOL)validate {
    
    BOOL result = [self.inputValidateManager validateInputTextField:self];
    NSLog(@"%@",self.inputValidateManager.attributeInputStr);
    if (result) {
        NSLog(@"-输入正确处理逻辑-");
    }else{
        NSLog(@"-输入错误处理逻辑-");
    }
   
    return result;
}



@end
