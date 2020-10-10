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

/*
 1、UIView和CLayer是组合模式，UIView内部有一个CLayer对象，准守并实现MZCALayerDelegate代理方法
 1、首先UIView继承UIResponder类可以响应事件，Layer不可以.
 2、一个 Layer 的 frame 是由它的 anchorPoint,position,bounds,和 transform 共同决定的，而一个 View 的 frame 只是简单的返回 Layer的 frame
 3、UIView主要是对显示内容的管理而 CALayer 主要侧重显示内容的绘制
 
 */

@interface MZUIView : UIResponder<MZCALayerDelegate>

//@property (nonatomic,strong,readonly) MZCALayer *layer;

@end

@interface MZUIView (MZUIViewRendering)

@property(nullable,nonatomic,copy) UIColor *backgroundColor;

@property(nonatomic) CGRect frame;

- (void)mzDrawRect:(NSString *)rect;

- (void)update;

@end

NS_ASSUME_NONNULL_END
