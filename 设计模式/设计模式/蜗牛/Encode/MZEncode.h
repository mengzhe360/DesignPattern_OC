//
//  MZEncode.h
//  设计模式
//
//  Created by A5 on 2020/1/13.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MZEncode : NSObject

+ (void)callTestParam;

+ (NSString *)testParamForcharValue:(char)charValue//c
    unsignedCharValue:(unsigned char)unsignedCharValue//C
           shortValue:(short)shortValue//s
   unsignedShortValue:(unsigned short)unsignedShortValue//S
             intValue:(int)intValue//i
     unsignedIntValue:(unsigned int)unsignedIntValue//I
            longValue:(long)longValue//l
    unsignedLongValue:(unsigned long)unsignedLongValue//L
        longLongValue:(long long)longLongValue//q
unsignedlongLongValue:(unsigned long long)unsignedlongLongValue//Q
           floatValue:(float)floatValue//f
          doubleValue:(double)doubleValue//d
            boolValue:(BOOL)boolValue//B
        selectorValue:(int(^)(int, int))selectorValue//:
            rectValue:(CGRect)rectValue//{name=type...}
            sizeValue:(CGSize)sizeValue//{name=type...}
          charPointer:(char *)charPointer//*
                point:(int *)pint//^
           classValue:(Class)classValue//#
        nsstringValue:(NSString *)nsstringValue//@
         nsarrayValue:(NSArray *)nsarrayValue//@
              idValue:(id)idValue//@;
          rectPointer:(CGRect *)rectPointer;

@end

NS_ASSUME_NONNULL_END
