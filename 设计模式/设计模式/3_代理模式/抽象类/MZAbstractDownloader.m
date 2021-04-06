//
//  MZAbstractDownloader.m
//  设计模式
//
//  Created by A5 on 2020/1/13.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "MZAbstractDownloader.h"

@implementation MZAbstractDownloader

/*
 我们可以利用组合（composition）、接口、委托（delegation）三个技术手段，一块儿来解决刚刚继承存在的问题
 
 抽象类更多的是为了代码复用，而接口就更侧重于解耦。
 
 抽象类:
 1.抽象类不允许被实例化，只能被继承
 2.抽象类可以包含属性和方法。方法既可以包含代码实现，也可以不包含代码实现,不包含代码实现的方法叫作抽象方法
 3.子类继承抽象类，必须实现抽象类中的所有抽象方法
 接口:(oc 的协议protocol)
 1.接口不能包含属性（也就是成员变量）。
 2.接口只能声明方法，方法不能包含代码实现。
 3.类实现接口的时候，(java)必须实现接口中声明的所有方法 OC(分@optional和@required)
 */

- (instancetype)init
{
    if ([self isMemberOfClass:[MZAbstractDownloader class]]) {
        NSAssert(![self isMemberOfClass:[MZAbstractDownloader class]], @"AbstractDownloader is an abstract class, you should not instantiate it directly.");
        [self doesNotRecognizeSelector:_cmd];
        return nil;
    }else{
        self = [super init];
        if (self) {
            
        }
        return self;
    }
}

- (void)setDownloadUrl:(NSString *)url{
    MZLog(url);
}

- (NSString *)checkDownloader {
    AbstractMethodNotImplemented();
}

- (void)deleteAllDownloadFile {
    AbstractMethodNotImplemented();
}

- (void)startDownload:(nonnull id)url {
    AbstractMethodNotImplemented();
}

- (BOOL)stopDownload {
    AbstractMethodNotImplemented();
}

- (float)testReturnFloat:(NSString *)valve{
    AbstractMethodNotImplemented();
}


@end
