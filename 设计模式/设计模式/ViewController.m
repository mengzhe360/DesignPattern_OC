//
//  ViewController.m
//  设计模式
//
//  Created by 孟哲 on 2020/1/6.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "ViewController.h"
#import "MZHMOne.h"
#import "MZHMTwo.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    MZHMOne *one = [MZHMOne new];
    [one setAlarm:true];
    [one run];
    
    MZHMTwo *two = [MZHMTwo new];
    [two run];
    
}

@end
