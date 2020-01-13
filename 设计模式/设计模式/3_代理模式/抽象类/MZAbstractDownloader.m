//
//  MZAbstractDownloader.m
//  设计模式
//
//  Created by A5 on 2020/1/13.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "MZAbstractDownloader.h"

@implementation MZAbstractDownloader


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
