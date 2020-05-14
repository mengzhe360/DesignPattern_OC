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


@end
