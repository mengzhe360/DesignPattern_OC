//
//  NSObject+MZ_KVO.m
//  设计模式
//
//  Created by A5 on 2021/3/29.
//  Copyright © 2021 孟哲. All rights reserved.
//

#import "NSObject+MZ_KVO.h"
#import <objc/message.h>

@implementation NSObject (MZ_KVO)

- (void)mz_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context{
    
    //动态添加一个类
    NSString *oldClassName = NSStringFromClass([self class]);
    NSString *newClassName = [@"mzkvo_" stringByAppendingString:oldClassName];
    //OC转C
    const char *newName = [newClassName UTF8String];
    //定义一个类
    Class MyClass = objc_allocateClassPair([self class], newName, 0);
    
    //动态添加setAge方法
    class_addMethod(MyClass, @selector(setAge:), (IMP)setAge, "v@:i");
    //注册这个类
    objc_registerClassPair(MyClass);
    //改变isa指针,让self指向子类的类对象（为了获取动态生成子对象的相关方法）
    object_setClass(self, MyClass);
    //给对象绑定观察者对象
    objc_setAssociatedObject(self, @"observer", observer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

/*
 id self,SEL _cmd,默认参数
 1、子类重写父类的setAge方法，OC中一般都会先调用[super method]
 2、如果父类的setAge方法里对age值做过什么处理，子类里面也会做一样的处理，所以需要先调用父类的setAge方法
 3、拿到属性旧值和新值做比较，如果逼样样触发监听observer方法
 */
void setAge(id self,SEL _cmd,int age){
    //子类自己
    id sClass = [self class];//mzkvo_MZPerson
    //父类
    id superClass = class_getSuperclass([self class]);//MZPerson
    
//    NSString *class1 = NSStringFromClass(class);
//
//    NSString *superClass1 = NSStringFromClass(superClass);
    
    //存放age改变值
    NSMutableDictionary * changeDic = [NSMutableDictionary dictionaryWithCapacity:0];
    
    //--------1、取父类的属性的值保存
    //改变isa指针，让自己(mzkvo_MZPerson)指向父类(MZPerson)
    object_setClass(self, superClass);
    
    NSString *class2 = NSStringFromClass([self class]);//MZPerson
   
    unsigned int oldOutCount = 0;
    //由于已经让self指向了自己的父类，所以在取属性的时候，可以直接用[self class]拿到age
    Ivar *oldivars = class_copyIvarList(superClass, &oldOutCount);
    struct objc_ivar *vars = (struct objc_ivar *)oldivars;
    
    for (unsigned int i = 0; i < oldOutCount; i ++) {
        Ivar ivar = oldivars[i];
        const char * name = ivar_getName(ivar);
        NSString * nameString = [[NSString alloc] initWithUTF8String:name];
        if ([nameString isEqualToString:@"_age"]) {
            [changeDic setValue:[self valueForKey:nameString] forKey:[NSString stringWithFormat:@"old%@",nameString]];
        }
    }
    free(oldivars);
    
    //--------2、调用父类的setAge方法,类似于OC的[super setAge:age]
    objc_msgSend(self, @selector(setAge:), age);
    
    //--------3、取动态子类的属性的值保存
    
    NSString *class3 = NSStringFromClass([self class]);//MZPerson
   
    //已经让self指向了自己，所以如果还是直接用[self class]的话是拿不到age属性的，因为age是父类的，并且现在这个子类的属性列表为空，容易在取值的时候造成崩溃，所以用superClass（因为superclassz指针是指向父类的，所以分类是不能找到子类的属性列表的）
    
    unsigned int newOutCount = 0;
    Ivar * newivars = class_copyIvarList(superClass, &newOutCount);
    for (int i = 0; i < newOutCount; i ++) {
        Ivar ivar = newivars[i];
        const char * name = ivar_getName(ivar);
        NSString * nameString = [[NSString alloc] initWithUTF8String:name];
        if ([nameString isEqualToString:@"_age"]) {
            [changeDic setValue:[self valueForKey:nameString] forKey:[NSString stringWithFormat:@"new%@",nameString]];
        }
    }
    free(newivars);
    
    //改变isa指针，让自己(mzkvo_MZPerson)指向(mzkvo_MZPerson)
    object_setClass(self, sClass);
    
    if ([[changeDic objectForKey:@"old_age"] intValue]
        != [[changeDic objectForKey:@"new_age"] intValue]) {
        //通知外界
        id observer = objc_getAssociatedObject(self, @"observer");
        [observer mz_observeValueForKeyPath:@"age" ofObject:self change:changeDic context:nil];
    }
    
}

- (void)mz_observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    
    NSLog(@"mz_observeValueForKeyPath");
    
}

- (void)setSex:(NSString *)sex{
    objc_setAssociatedObject(self, @selector(sex), sex, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)sex{
      return objc_getAssociatedObject(self, _cmd);
}

struct objc_ivar {
//    char * _Nullable ivar_name                               OBJC2_UNAVAILABLE;
//    char * _Nullable ivar_type                               OBJC2_UNAVAILABLE;
//    int ivar_offset                                          OBJC2_UNAVAILABLE;
//#ifdef __LP64__
//    int space                                                OBJC2_UNAVAILABLE;
//#endif
};
@end
