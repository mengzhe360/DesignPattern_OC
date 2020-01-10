//
//  MZComposite.m
//  设计模式
//
//  Created by 孟哲 on 2020/1/11.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "MZComposite.h"

@interface MZComposite ()

@property (nonatomic,strong) NSMutableArray <MZComponent *>*componentMArr;

@end

@implementation MZComposite

- (void)add:(MZComponent *)component
{
    component.parentComponent = self;//设置父节点，为了可以倒序查找遍历
    [self.componentMArr addObject:component];
}

- (void)remove:(MZComponent *)component
{
    [self.componentMArr removeObject:component];
}

- (NSArray <MZComponent *>*)getChildren
{
    return self.componentMArr.copy;
}

- (void)operationSomething
{
    NSLog(@"%@ - operationSomething",self.name);
    NSLog(@"%@ - 父节点是:%@",self.name,self.parentComponent.name);
}

- (NSMutableArray<MZComponent *> *)componentMArr
{
    if (!_componentMArr) {
        _componentMArr = [[NSMutableArray alloc] init];
    }
    return _componentMArr;
}


@end
