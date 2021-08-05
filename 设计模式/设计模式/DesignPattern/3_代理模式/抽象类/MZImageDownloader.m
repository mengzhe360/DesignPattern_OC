//
//  MZImageDownloader.m
//  设计模式
//
//  Created by A5 on 2020/1/13.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "MZImageDownloader.h"

@implementation MZImageDownloader

- (NSString *)checkDownloader
{
    MZMLog
    return @"测试返回值";
}
 
- (void)startDownload:(id)url
{
    MZLog(url);
}
 
- (BOOL)stopDownload
{
    MZMLog
    return NO;
}
 
- (void)deleteAllDownloadFile
{
    MZMLog
}

- (float)testReturnFloat:(NSString *)valve
{
    NSString *valveStr = [NSString stringWithFormat:@"%@",valve];
    MZLog(valveStr);
    return [valveStr floatValue];
}

@end
