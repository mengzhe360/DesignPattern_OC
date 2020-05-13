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
    CGContextSetStrokeColorWithColor(context, UIColor.systemBlueColor.CGColor);
    CGContextSetLineWidth(context,20);
//    CGContextBeginPath(context);
//    for (int k = 0; k < 2; k ++) {
//        CGContextMoveToPoint(context, 300, 200);
//        CGContextAddLineToPoint(context, 300, 400);
//    }
//    CGContextStrokePath(context);
    
    
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
    
    
    CGContextSetLineWidth(context, 2);
    //30倍PE河流图
    CGContextSetFillColorWithColor(context, [UIColor systemOrangeColor].CGColor);
    CGContextMoveToPoint(context, 10, 300);
    CGContextAddLineToPoint(context, 50,100 );
    CGContextAddLineToPoint(context, 80,100 );
    CGContextAddLineToPoint(context, 100,200 );
    CGContextAddLineToPoint(context, 150,500 );
    CGContextAddLineToPoint(context, 180, 103);
    CGContextAddLineToPoint(context, 220,300 );
    CGContextDrawPath(context, kCGPathFill);
    
    
}

@end
