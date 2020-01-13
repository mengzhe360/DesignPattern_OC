//
//  MZDownloaderProtocol.h
//  设计模式
//
//  Created by A5 on 2020/1/13.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MZDownloaderProtocol <NSObject>

@required
 
- (NSString *)checkDownloader;
 
- (void)startDownload:(id)url;
 
- (BOOL)stopDownload;
 
- (void)deleteAllDownloadFile;

- (float)testReturnFloat:(NSString *)valve;

@end

NS_ASSUME_NONNULL_END
