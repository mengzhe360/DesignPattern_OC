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
 2、一个 Layer 的 frame 是由它的 anchorPoint（特有）,position,bounds,和 transform 共同决定的，而一个 View 的 frame 只是简单的返回 Layer的 frame
 3、UIView主要是对显示内容的管理而 CALayer 主要侧重显示内容的绘制
 4、CLayer的anchorPoint和position属性共同决定图层相对父图层的位置,即frame的x,y
    a、锚点使用单位坐标来描述,范围为左上角{0, 0}到右下角{1, 1},默认坐标是{0.5, 0.5}.
    b、anchorPoint在图层旋转时的固定点
 5、CALayer 内部并没有属性，当调用属性方法时，它内部是通过运行时 resolveInstanceMethod 为对象临时添加一个方法，并把对应属性值保存到内部的一个 Dictionary 里，同时还会通知 delegate、创建动画等等，非常消耗资源
 6、为了避免离屏渲染，你应当尽量避免使用 layer 的 border、corner、shadow、mask 等技术
 7、离屏渲染，指的是GPU在当前屏幕缓冲区以外新开辟一个缓冲区进行渲染操作，离屏耗时原因主要有创建缓冲区和上下文切换
 8、对于有前后依赖的图层（如全局剪切，阴影等），油画算法无法满足我们的需求，对于有前后依赖的图层，我们可以再另开辟一个空间，用于临时渲染，渲染完成后再渲染到当前的缓冲区上，这个临时渲染，就是离屏渲染，由于需要开辟一个新的内存空间，并且共享同一个上下文，所以还需要做上下文切换（状态切换），并且渲染完成后还要进行拷贝操作
 
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
