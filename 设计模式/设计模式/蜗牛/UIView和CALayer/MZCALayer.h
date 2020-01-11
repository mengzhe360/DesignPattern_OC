//
//  MZCALayer.h
//  设计模式
//
//  Created by A5 on 2020/1/11.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MZCALayerDelegate <NSObject>

@required;
- (void)mzDisplayLayer:(NSString *)layer;

@end

@interface MZCALayer : NSObject

@property(nullable, weak) id <MZCALayerDelegate> delegate;

@property(nonatomic) CGRect frame;

- (void)addSublayer:(MZCALayer *)layer;

@end

NS_ASSUME_NONNULL_END
