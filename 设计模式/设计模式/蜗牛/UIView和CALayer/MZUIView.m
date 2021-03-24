//
//  MZUIView.m
//  设计模式
//
//  Created by A5 on 2020/1/11.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "MZUIView.h"
#import "MZCALayer.h"

@interface MZUIView ()

@property (nonatomic,strong) MZCALayer *mlayer;

@end

@implementation MZUIView

- (instancetype)init
{
    self = [super init];
    if (self) {
        MZCALayer *layer = [[MZCALayer alloc] init];
        self.mlayer = layer;
        self.mlayer.delegate = (id)self;
    }
    return self;
}

- (void)setFrame:(CGRect)frame
{
    self.mlayer.frame = frame;
}

- (CGRect)frame
{
   return self.mlayer.frame;
}

- (MZCALayer *)layer
{
    return self.mlayer;
}

//MZCALayerDelegate
- (void)mzDisplayLayer:(nonnull NSString *)layer {
    MZLog(layer);
}

- (void)mzDrawRect:(NSString *)rect{
    MZLog(rect);
}

- (void)update{
    
}

@end
