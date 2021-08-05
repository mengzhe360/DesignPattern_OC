//
//  MZShapeLayerView.m
//  设计模式
//
//  Created by A5 on 2021/8/3.
//  Copyright © 2021 孟哲. All rights reserved.
//

#import "MZShapeLayerView.h"

@interface MZShapeLayerView ()

// 灰色虚线
@property (nonatomic, strong)CAShapeLayer *baseLayer;
// 彩色虚线
@property (nonatomic, strong)CAShapeLayer *shapeLayer;
// 外圈灰色大圆
@property (nonatomic, strong)CAShapeLayer *bigBaseLayer;
// 带颜色的大圆
@property (nonatomic, strong)CAShapeLayer *bigShapeLayer;

@end

@implementation MZShapeLayerView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = frame;
        self.backgroundColor = UIColor.whiteColor;
        
        //创建出CAShapeLayer
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.frame = CGRectMake(0, 0, 200, 200);//设置shapeLayer的尺寸和位置
        shapeLayer.backgroundColor = [UIColor greenColor].CGColor;
        shapeLayer.position = self.center;
        shapeLayer.fillColor = [UIColor grayColor].CGColor;//填充颜色为ClearColor
           
        //设置线条的宽度和颜色
        shapeLayer.lineWidth = 20.0f;
        shapeLayer.strokeColor = [UIColor redColor].CGColor;
           
        //创建出圆形贝塞尔曲线
        UIBezierPath *circlePath = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 100, 100)];
        [circlePath moveToPoint:CGPointMake(100, 100)];
        [circlePath addLineToPoint:CGPointMake(200,200)];
//        [circlePath addLineToPoint:CGPointMake(150, 330)];
//        [circlePath closePath];
        circlePath.lineCapStyle = kCGLineCapRound;
        circlePath.lineJoinStyle = kCGLineJoinRound;
       
        //让贝塞尔曲线与CAShapeLayer产生联系
        shapeLayer.path = circlePath.CGPath;
        
    
        //添加并显示
        [self.layer addSublayer:shapeLayer];
        
        
        CGSize finalSize = CGSizeMake(CGRectGetWidth(self.frame), 600);
        CGFloat layerHeight = finalSize.height * 0.2;
        CAShapeLayer *bottomCurveLayer = [[CAShapeLayer alloc]init];
        bottomCurveLayer.lineWidth = 20.0f;
        shapeLayer.strokeColor = [UIColor redColor].CGColor;
        
        UIBezierPath *path = [[UIBezierPath alloc]init];
        path.lineCapStyle = kCGLineCapRound;
        path.lineJoinStyle = kCGLineJoinRound;
        [path moveToPoint:CGPointMake(0, finalSize.height - layerHeight)];
        [path addLineToPoint:CGPointMake(0, finalSize.height - 1)];
        [path addLineToPoint:CGPointMake(finalSize.width, finalSize.height - 1)];
        [path addLineToPoint:CGPointMake(finalSize.width, finalSize.height - layerHeight)];
        [path addQuadCurveToPoint:CGPointMake(0, finalSize.height - layerHeight) controlPoint:CGPointMake(finalSize.width / 2, (finalSize.height - layerHeight) - 40)];
        [path stroke];
        
        bottomCurveLayer.path = path.CGPath;
//        bottomCurveLayer.fillColor = [UIColor orangeColor].CGColor;
        [self.layer addSublayer:bottomCurveLayer];

          /**
           上面的结果是一整个圆，现在我们要用到CAShapeLayer的两个参数，strokeEnd和strokeStart
            Stroke:用笔画的意思
            在这里就是起始笔和结束笔的位置
            Stroke为1的话就是一整圈，0.5就是半圈，0.25就是1/4圈。以此类推
            如果我们把起点设为0，终点设为0.75
         **/
           
        //设置stroke起始点
//        shapeLayer.strokeStart = 0;
//        shapeLayer.strokeEnd = 0.75;
           
           /*
            下面来加个基础动画玩玩
           */
        CABasicAnimation *pathAnima = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
        pathAnima.duration = 3.0f;
        pathAnima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        pathAnima.fromValue = [NSNumber numberWithFloat:0.0f];
        pathAnima.toValue = [NSNumber numberWithFloat:1.0f];
        pathAnima.fillMode = kCAFillModeForwards;
        pathAnima.removedOnCompletion = NO;
        [shapeLayer addAnimation:pathAnima forKey:nil];
        
        UIBezierPath *path1 = [UIBezierPath bezierPath];
        
        path1.lineWidth = 5.0;
        path1.lineCapStyle = kCGLineCapRound;
        path1.lineJoinStyle = kCGLineJoinRound;
        [path1 moveToPoint:CGPointMake(40, 150)];
        [path1 addQuadCurveToPoint:CGPointMake(140, 200) controlPoint:CGPointMake(180, 40)];
        [path1 stroke];
        
        CAShapeLayer *_shapeLine = [CAShapeLayer layer];
        _shapeLine.frame = self.bounds;
        _shapeLine.lineWidth = 10;
        _shapeLine.lineJoin = kCALineCapButt;
        _shapeLine.lineDashPattern = @[@(20),@(5)];
        _shapeLine.fillColor = [UIColor redColor].CGColor;
        _shapeLine.strokeColor = [UIColor yellowColor].CGColor;
        _shapeLine.path = path1.CGPath;
        [self.layer addSublayer:_shapeLine];
        
        CABasicAnimation *moveAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
        moveAnimation.fromValue = [NSValue valueWithCGPoint:_shapeLine.position];
        moveAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(320 - 80, _shapeLine.position.y)];
        moveAnimation.autoreverses = YES;
        moveAnimation.repeatCount = MAXFLOAT;
        moveAnimation.duration = 2;
        
        [_shapeLine addAnimation:moveAnimation forKey:@"position"];
        
    }
    return self;
}



@end
