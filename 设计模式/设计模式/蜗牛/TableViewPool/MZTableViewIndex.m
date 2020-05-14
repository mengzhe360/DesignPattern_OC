//
//  MZTableViewIndex.m
//  设计模式
//
//  Created by 孟哲 on 2020/2/27.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "MZTableViewIndex.h"
#import "MZReusePool.h"

@interface MZTableViewIndex (){
    UIView *containerView;
    MZReusePool *reusePool;
}

@end

@implementation MZTableViewIndex

/// 重写系统方法
- (void)reloadData{
    
    [super reloadData];
    
    // 懒加载
    if (containerView == nil) {
        containerView = [[UIView alloc] initWithFrame:CGRectZero];
        containerView.backgroundColor = [UIColor whiteColor];
        
        //避免索引条随着table滚动
        [self.superview insertSubview:containerView aboveSubview:self];
        
        self.superview.backgroundColor = [UIColor redColor];
        NSLog(@"self.superview:%@",self.superview);
    }
    
    if (reusePool == nil) {
        reusePool = [[MZReusePool alloc] init];
    }
    
    // 标记所有视图为可重用状态
    [reusePool reset];
    
    // reload字母索引条
    [self reloadIndexedBar];
}

- (void)reloadIndexedBar
{
    // 获取字母索引条的显示内容
    NSArray <NSString *> *arrayTitles = nil;
    if ([self.indexedDataSource respondsToSelector:@selector(indexTitlesForIndexTableView:)]) {
        arrayTitles = [self.indexedDataSource indexTitlesForIndexTableView:self];
    }
    
    // 判断字母索引条是否为空
    if (!arrayTitles || arrayTitles.count <= 0) {
        [containerView setHidden:YES];
        return;
    }
    
    NSUInteger count = arrayTitles.count;
    CGFloat buttonWidth = 60;
    CGFloat buttonHeight = self.frame.size.height / count;
    
    for (int i = 0; i < [arrayTitles count]; i++) {
        NSString *title = [arrayTitles objectAtIndex:i];
        
        // 从重用池当中取一个Button出来
        UIButton *button = (UIButton *)[reusePool dequeueReusableView];
        // 如果没有可重用的Button重新创建一个
        if (button == nil) {
            button = [[UIButton alloc] initWithFrame:CGRectZero];
            button.backgroundColor = [UIColor greenColor];
           
            [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
            
            //新创建一个Button 注册button到重用池当中
            [reusePool addUsingView:button];
            NSLog(@"新创建一个Button");
        }
        else{
            NSLog(@"Button 重用了");
        }
        
        // 添加button到父视图控件
        [containerView addSubview:button];
        button.tag = i;
        [button setTitle:title forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        // 设置button的坐标
        [button setFrame:CGRectMake(0, i * buttonHeight, buttonWidth, buttonHeight)];
    }
    
    [containerView setHidden:NO];
    containerView.frame = CGRectMake(self.frame.origin.x + self.frame.size.width - buttonWidth, self.frame.origin.y, buttonWidth, self.frame.size.height);
}


- (void)btnClick:(UIButton *)btn
{
    NSLog(@"btn:%@",btn.titleLabel);

//    UIResponder *nextResponder = btn.nextResponder;
//    NSMutableString *pre = [NSMutableString stringWithString:@"--"];
//    NSLog(@"btn----1");
//    while (nextResponder) {
//        NSLog(@"%@%@", pre, NSStringFromClass([nextResponder class]));
//        [pre appendString:@"--"];
//        nextResponder = nextResponder.nextResponder;
//    }
    
    if ([self.indexedDataSource respondsToSelector:@selector(scrollToRowAtIndexPathOfIndex:)]) {
        
        [self.indexedDataSource scrollToRowAtIndexPathOfIndex:btn.tag];
    }
    
}




@end
