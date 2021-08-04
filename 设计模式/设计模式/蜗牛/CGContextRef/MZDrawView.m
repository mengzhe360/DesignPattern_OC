//
//  MZDrawView.m
//  设计模式
//
//  Created by A5 on 2020/3/13.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "MZDrawView.h"

@implementation MZDrawView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = frame;
        self.backgroundColor = UIColor.whiteColor;
    }
    return self;
}

//- (void)drawRect:(CGRect)rect
//{
//    [super drawRect:rect];
//    float grade = 0.1;
//    CGFloat borderWidth = 20;
//    CGFloat radius = self.bounds.size.width / 2;
//    grade = grade > 0 ? grade : 0;
//    UIColor *bgColor = [UIColor redColor];
//    UIColor *tintColor = [UIColor greenColor];
//    UIColor *onTintColor = [UIColor yellowColor];
//    CGPoint center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
//
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextClearRect(context, rect);
//
//    //填充当区域内的颜色与父视图相同
//    [bgColor set];
//    CGContextFillRect(context, rect);
//
//    CGContextFillPath(context);
//
//    //绘制两个扇形
//    float angle_start = radians(0.0);
//    float angle_end = radians(360 * grade);
//    CGContextMoveToPoint(context, center.x, center.y);
//    CGContextSetFillColor(context, CGColorGetComponents(onTintColor.CGColor));
//    CGContextAddArc(context, center.x, center.y, radius*2/3, angle_start, angle_end, 0);
//    CGContextFillPath(context);
////    CGContextStrokePath(context);
//
//    angle_start = angle_end;
//    angle_end = radians(360.0);
//    CGContextMoveToPoint(context, center.x, center.y);
//    CGContextSetFillColor(context, CGColorGetComponents(tintColor.CGColor));
//    CGContextAddArc(context, center.x, center.y, radius*2/3, angle_start, angle_end, 0);
//    CGContextFillPath(context);
////    CGContextStrokePath(context);
//
////    绘制圆颜色与父视图相同
//    CGFloat w = (self.bounds.size.width)/4 - borderWidth;
//    CGContextAddEllipseInRect(context, CGRectMake(center.x - w, center.y - w, w * 2, w * 2));
//    [bgColor set];
//    CGContextFillPath(context);//实心的
////    CGContextStrokePath(context);//空心的
//
//    //调整方向
////    self.layer.transform = CATransform3DMakeRotation(M_PI * -0.5, 0, 0, 1);
////    self.layer.shadowRadius = radius;
////    self.layer.masksToBounds = YES;
//}

static inline float radians(double degrees) {
    return degrees * M_PI / 180;
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
{
    
}

- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];


//    (x = 91, y = 147.08767498158088)
//
//    (lldb) po obj.invest
//    (x = 91, y = 135.49836859277971)
//
//    (lldb) po obj.foreign
//    (x = 91, y = 146.14356383538575)

    CGPoint p1 = CGPointMake(100, 100);
    CGPoint p2 = CGPointMake(100, 300);
    CGPoint p3 = CGPointMake(100, 500);
    CGPoint p4 = CGPointMake(300, 300);


    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, UIColor.redColor.CGColor);
    CGContextSetLineWidth(context,10);
//    CGContextBeginPath(context);
//    for (int k = 0; k < 2; k ++) {
//
//    }
    CGContextMoveToPoint(context, 300, 200);
    CGContextAddLineToPoint(context, 300, 400);
    CGContextStrokePath(context);


//    const CGPoint line1[] = {p1,p2};
//    CGContextStrokeLineSegments(context, line1, 2);
//
//    CGContextSetStrokeColorWithColor(context, UIColor.redColor.CGColor);
//    const CGPoint line2[] = {p2,p3};
//    CGContextStrokeLineSegments(context, line2, 2);
//
//    CGContextSetStrokeColorWithColor(context, UIColor.yellowColor.CGColor);
//    const CGPoint line3[] = {p2,p4};
//    CGContextStrokeLineSegments(context, line3, 2);
//
//    CGContextSetStrokeColorWithColor(context, UIColor.grayColor.CGColor);
//    const CGPoint line4[] = {p1,p4};
//    CGContextStrokeLineSegments(context, line4, 2);


//    CGContextSetLineWidth(context, 2);
//    //30倍PE河流图
//    CGContextSetFillColorWithColor(context, [UIColor systemOrangeColor].CGColor);
//    CGContextMoveToPoint(context, 10, 300);
//    CGContextAddLineToPoint(context, 50,100 );
//    CGContextAddLineToPoint(context, 80,100 );
//    CGContextAddLineToPoint(context, 100,200 );
//    CGContextAddLineToPoint(context, 150,500 );
//    CGContextAddLineToPoint(context, 180, 103);
//    CGContextAddLineToPoint(context, 220,300 );
//    CGContextDrawPath(context, kCGPathFillStroke);


    //矩形，并填弃颜色
//    CGContextSetLineWidth(context, 5.0);//线的宽度
//    CGContextSetFillColorWithColor(context, [UIColor greenColor].CGColor);//填充颜色
//    CGContextSetStrokeColorWithColor(context, [UIColor yellowColor].CGColor);//线框颜色
//    CGContextAddRect(context,CGRectMake(40, 120, 260, 30));//画方框
//    CGContextDrawPath(context, kCGPathStroke);//绘画路径
//    CGContextFillRect(context,CGRectMake(40, 120, 260, 30));//填充框


}

@end
