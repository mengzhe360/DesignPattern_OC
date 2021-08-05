//
//  MZAbstractDownloader.h
//  设计模式
//
//  Created by A5 on 2020/1/13.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MZDownloaderProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface MZAbstractDownloader : NSObject<MZDownloaderProtocol>

- (void)setDownloadUrl:(NSString *)url;

@end

NS_ASSUME_NONNULL_END
