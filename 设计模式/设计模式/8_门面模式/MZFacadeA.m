//
//  MZFacadeA.m
//  设计模式
//
//  Created by 孟哲 on 2020/1/12.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "MZFacadeA.h"
#import "MZFacadeSubsystemA.h"
#import "MZFacadeSubsystemB.h"
#import "MZFacadeSubsystemC.h"

@implementation MZFacadeA

- (void)facadeAMethodA
{
    MZMLog
    MZFacadeSubsystemA *A = [[MZFacadeSubsystemA alloc] init];//被委托对象（子系统）
    [A facadeSubsystemA];
    [(id<MZFacadeSubsystem>)A facadeSubsystemDelegate];
}

- (void)facadeAmethodB
{
    MZMLog
    MZFacadeSubsystemB *B = [[MZFacadeSubsystemB alloc] init];
    [B facadeSubsystemB];
    [(id<MZFacadeSubsystem>)B facadeSubsystemDelegate];
    [self performClassName:@"MZFacadeSubsystemB" selector:@"facadeSubsystemDelegate" objects:@[] type:kInstanceMethod];
}

- (void)facadeAmethodC
{
    MZMLog
    [self performClassName:@"MZContext" selector:@"complexMethod" objects:@[] type:kInstanceMethod];
}

- (void)facadeImageDownloader
{
    NSObject *downloader = [NSObject objectForClassName:@"MZImageDownloader"];
    [self performClass:downloader selector:@"setDownloadUrl:" objects:@[@"https://www.baidu.com/"] type:kInstanceMethod];
    id valueA = [self performClass:downloader selector:@"checkDownloader" objects:@[] type:kInstanceMethod];
    [self performClass:downloader selector:@"startDownload:" objects:@[@"https://www.baidu.com/"] type:kInstanceMethod];
    id valueB = [self performClass:downloader selector:@"stopDownload" objects:@[] type:kInstanceMethod];
    [self performClass:downloader selector:@"deleteAllDownloadFile" objects:@[] type:kInstanceMethod];
    id valueC = [self performClass:downloader selector:@"testReturnFloat:" objects:@[@1101101] type:kInstanceMethod];
    MZLog(valueA); MZLog(valueB); MZLog(valueC);
    
//    [self performClassName:@"MZAbstractDownloader" selector:@"setDownloadUrl:" objects:@[@"测试直接实例化抽象类-就让他直接crash"] type:kInstanceMethod];
}

@end
