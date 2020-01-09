//
//  MZRouterEventViewController.m
//  设计模式
//
//  Created by A5 on 2020/1/9.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "MZRouterEventViewController.h"

@interface MZRouterEventViewController ()
@property (strong, nonatomic) IBOutlet UIView *greenView;
@property (weak, nonatomic) IBOutlet UIView *redView;

@end

@implementation MZRouterEventViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.yellowColor;
    self.navigationController.title = @"MZRouterEvent";
    
}

- (IBAction)btnClick:(id)sender {
    
    [self routerEventWithSelectorName:@"btnClick:userInfo:" object:sender userInfo:@{@"key":@"routerEvent"}];
}


- (void)routerEventWithSelectorName:(NSString *)selectorName
                             object:(id)object
                           userInfo:(NSDictionary *)userInfo{
    
    void(^MZBlock1)(NSString *) = ^(NSString *mz) {
        NSLog(@"mz:%@",mz);
    };

    [self performClassName:@"MZAViewController" selector:@"mztest:callBlock:" withObjects:@[@"perform测试",MZBlock1] type:kClassMethod];
    
}

@end
