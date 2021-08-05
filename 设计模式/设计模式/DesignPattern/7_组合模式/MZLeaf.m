//
//  MZLeaf.m
//  设计模式
//
//  Created by 孟哲 on 2020/1/11.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "MZLeaf.h"

@implementation MZLeaf

- (void)operationSomething
{
    NSLog(@"%@ - operation",self.name);
    NSLog(@"%@ - 父节点是:%@",self.name,self.parentComponent.name);
}

@end
