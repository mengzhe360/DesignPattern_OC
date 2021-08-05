//
//  MZElementProtocol.h
//  设计模式
//
//  Created by A5 on 2020/1/15.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MZVisitorProtocol;

NS_ASSUME_NONNULL_BEGIN

@protocol MZElementProtocol <NSObject>

/**
 *  接收访问者（核心方法）
 *  在编译的时候就确定了，所以会调用 extractor 的 extract2txt(PdfFile pdfFile) 这个重载函数。这个实现思路是不是很有技巧？这是理解访问者模式的关键所在
 *  @param visitor 访问者对象
 */
- (void)accept:(id <MZVisitorProtocol>)visitor;

/**
 *  元素公共的操作
 */
- (void)operation;

@end

NS_ASSUME_NONNULL_END
