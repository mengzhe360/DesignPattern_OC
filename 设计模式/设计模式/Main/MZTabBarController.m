//
//  MZTabBarController.m
//  设计模式
//
//  Created by A5 on 2020/1/8.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "MZTabBarController.h"
#import "MZAViewController.h"
#import "MZBViewController.h"
#import "MZCViewController.h"

@interface MZTabBarController ()

@end

@implementation MZTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MZAViewController *v1 = [MZAViewController new];
    MZBViewController *v2 = [MZBViewController new];
    MZCViewController *v3 = [MZCViewController new];
    
    UINavigationController *n1 = [[UINavigationController alloc] initWithRootViewController:v1];
    n1.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"AVC" image:nil selectedImage:nil];
    
    UINavigationController *n2 = [[UINavigationController alloc] initWithRootViewController:v2];
    n2.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"BVC" image:nil selectedImage:nil];
    
    UINavigationController *n3 = [[UINavigationController alloc] initWithRootViewController:v3];
    n3.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"CVC" image:nil selectedImage:nil];
    
    self.viewControllers = @[n1,n2,n3];
    
}


@end
