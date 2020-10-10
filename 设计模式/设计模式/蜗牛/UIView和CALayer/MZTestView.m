//
//  MZTestView.m
//  设计模式
//
//  Created by A5 on 2020/1/11.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "MZTestView.h"

@implementation MZTestView

//MZCALayerDelegate
//- (void)mzDisplayLayer:(NSString *)layer
//{
//    NSLog(@"%@实现代理%@-%@",NSStringFromClass(self.class),NSStringFromSelector(_cmd),layer);
//    
//}

//MZUIView方法
- (void)mzDrawRect:(NSString *)rect
{
    NSLog(@"%@重写父类%@-%@",NSStringFromClass(self.class),NSStringFromSelector(_cmd),rect);
    
    [super mzDrawRect:rect];
}

@end
