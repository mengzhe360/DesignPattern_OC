//
//  MZUIView.h
//  设计模式
//
//  Created by A5 on 2020/1/11.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MZCALayer.h"

NS_ASSUME_NONNULL_BEGIN

@interface MZUIView : UIResponder<MZCALayerDelegate>

@property (nonatomic,strong,readonly) MZCALayer *layer;

@end

@interface MZUIView (MZUIViewRendering)

@property(nullable,nonatomic,copy) UIColor *backgroundColor;

@property(nonatomic) CGRect frame;

- (void)mzDrawRect:(NSString *)rect;

- (void)update;

@end

NS_ASSUME_NONNULL_END
