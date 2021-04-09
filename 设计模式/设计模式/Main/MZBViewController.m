//
//  MZBViewController.m
//  设计模式
//
//  Created by A5 on 2020/1/8.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "MZBViewController.h"
#import "MZReusePoolViewController.h"
#import "MZPerson.h"
#import "MZBlockViewController.h"
#import "MZPersonViewController.h"

@interface MZBViewController ()<UIWebViewDelegate>

@property(nonatomic,strong)NSArray *arr;
@property(nonatomic,strong)NSMutableArray *mutArray;
@property (nonatomic,strong) NSHashTable *hashTable;

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
//
//    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.baidu.com/"]]];
    
    MZPersonViewController *pool = [[MZPersonViewController alloc] init];
    [self.navigationController pushViewController:pool animated:YES];

    
}

- (void)blockTest
{
    MZBlockViewController *bVC = [MZBlockViewController new];
    bVC.gesturesVcSetBlock = ^(BOOL isSuccess, UIViewController * count) {

        self.arr = @[@"q",@"w"];//bVC的实例并不是当前类的成员属性，不会造成循环引用，block内部强引用了 self， 但 self 没有强引用BViewController的实例对象
//        bVC.bStr = @"在内部加上这句会造成循环引用";//这一句造成 BVC 和 block 造成循环引用
        if (isSuccess) {

            NSLog(@"回调过来的B控制器:%@",count);

        }

    };
  
    [self.hashTable addObject:bVC];//加上这句会造成循环引用 ，因为 self强引用了 bVC
    
    [self.navigationController pushViewController:bVC animated:YES];
}


- (void)webViewDidStartLoad:(UIWebView *)webView {
    NSLog(@"%s",__func__);
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    NSLog(@"%s",__func__);
}

/**
 在for in 循环中删除数组内部对象可能会引起崩溃
 1、如果是生产者-消费者的关系，就是往数组里添加或者删除元素，为了保证数据安全用pthread_mutex_t锁
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

- (NSMutableArray *)mutArray{
    
    if (_mutArray == nil) {
        _mutArray = [[NSMutableArray array] init];
    }
    return _mutArray;
}

-(NSHashTable *)hashTable
{
    if (!_hashTable) {
        _hashTable = [NSHashTable hashTableWithOptions:NSHashTableStrongMemory];
//        _hashTable = [NSHashTable hashTableWithOptions:NSHashTableWeakMemory];
    }
    return _hashTable;
}

- (void)dealloc{
    NSLog(@"%s",__func__);
}


@end
