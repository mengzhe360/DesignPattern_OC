//
//  MZStrategyViewController.m
//  单例释放
//
//  Created by 孟哲 on 2019/1/26.
//  Copyright © 2019 mengzhe. All rights reserved.
//

#import "MZStrategyViewController.h"
#import "MZAlphaInputValidator.h"
#import "MZNumericInputValidator.h"
#import "MZCustomTextField.h"

@interface MZStrategyViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet MZCustomTextField *oneInput;
@property (weak, nonatomic) IBOutlet MZCustomTextField *twoInput;
@property (weak, nonatomic) IBOutlet MZCustomTextField *threeInput;

@property (weak, nonatomic) IBOutlet UIButton *clickBtn;

@end

@implementation MZStrategyViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.oneInput.delegate = self;
    self.twoInput.delegate = self;
    
    [self.oneInput addTarget:self action:@selector(changedTextField:) forControlEvents:UIControlEventEditingChanged];
    
    [self.twoInput addTarget:self action:@selector(changedTextField:) forControlEvents:UIControlEventEditingChanged];
    
    self.oneInput.inputValidateManager = [MZAlphaInputValidator new];
    self.twoInput.inputValidateManager = [MZNumericInputValidator new];
    self.threeInput.inputValidateManager = [MZInputValidator new];
    
}


- (IBAction)clickBtnCheck:(id)sender {
    
    NSLog(@"验证！！！");
}

- (void)changedTextField:(UITextField *)textField
{
    if ([textField isKindOfClass:[MZCustomTextField class]]) {
          NSLog(@"textField:%@",textField.text);
         [(MZCustomTextField *)textField  validate];
     }
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
 
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

@end
