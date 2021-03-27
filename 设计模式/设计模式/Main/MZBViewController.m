//
//  MZBViewController.m
//  设计模式
//
//  Created by A5 on 2020/1/8.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "MZBViewController.h"
#import "MZReusePoolViewController.h"

@interface MZBViewController ()<UIWebViewDelegate>

@end

@implementation MZBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.redColor;
    self.navigationItem.title = @"MZB";
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
//    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
//    webView.delegate = self;
//    webView.backgroundColor = [UIColor redColor];
//    [self.view addSubview:webView];
//    //    webView.delegate = self;
//
//    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.baidu.com/"]]];
    
    MZReusePoolViewController *pool = [[MZReusePoolViewController alloc] init];
    [self.navigationController pushViewController:pool animated:YES];
 
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    NSLog(@"-1-webViewDidStartLoad:");
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    NSLog(@"-2-webViewDidFinishLoad:");
}

/**
 在for in 循环中删除数组内部对象可能会引起崩溃
 */
- (void)arrayCrash
{
    NSMutableArray *array = [NSMutableArray arrayWithObjects:@"2",@"3",@"4",@"9",@"12",@"22",@"5",@"6",@"1", nil];
    
    
        for (NSString *str in array) {
    
            if ([str isEqualToString:@"4"]) {
    
//                [array removeObject:str];
    
            }
    
        }
    
    
    //如果像以下代码不采用快速遍历，而是使用for循环
        for (int i = 0; i < array.count; i++) {
    
            NSString *str  = array[i];
    
    
            if ([str isEqualToString:@"4"]) {
    
//                [array removeObject:str];
    
            }
    
        }
    
        // 第二种解决方法是定义一个副数组，遍历副本中的元素，在原数组中删除。
        NSArray *copyArray = [NSMutableArray arrayWithArray:array];
    
        for (NSString *str in copyArray) {
    
            if ([str isEqualToString:@"4"]) {
    
                NSInteger index = [array indexOfObject:@"4"];
                [array removeObjectAtIndex:index];
    
            }
        }
    
//    第三种方法是对数组逆序遍历,查找对应元素后删除
//        [array add:[NSNull null]];
    
    NSLog(@"array:%@",array);
    
    NSEnumerator *enumerator = [array reverseObjectEnumerator];
    
    NSLog(@"enumerator:%@",enumerator.allObjects);
    
    for (NSString *str in enumerator) {//如果第一个元素为 null 直接就进不到循环体里内了
        
        if ([str isEqual:NULL]) {
            NSLog(@"str isEqual:NULL");
        }
        
        if ([str isEqualToString:@"4"]) {
            
            [array removeObject:str];
            
        }
        
    }
    
}


@end
