//
//  MZEncode.m
//  设计模式
//
//  Created by A5 on 2020/1/13.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "MZEncode.h"

@implementation MZEncode

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
                        rectPointer:(CGRect *)rectPointer
{
    return @"return string";
}

+ (void)callTestParam
{
    SEL sel =  @selector(testParamForcharValue:unsignedCharValue:shortValue:unsignedShortValue:intValue:unsignedIntValue:longValue:unsignedLongValue:longLongValue:unsignedlongLongValue:floatValue:doubleValue:boolValue:selectorValue:rectValue:sizeValue:charPointer:point:classValue:nsstringValue:nsarrayValue:idValue:rectPointer:);
    NSMethodSignature *signature = [[self class] methodSignatureForSelector:sel];
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    [invocation setTarget:self];
    [invocation setSelector:sel];

    char charParam = 't';
    unsigned char unsignedCharParam = 't';
    short shortParam = 10;
    unsigned short unsignedShortParam = 10;
    int intParam = 10;
    unsigned int unsignedIntParam = 10;
    long longParam = 88;
    unsigned long unsignedLongParam = 88;
    long long longLongParam = 88;
    unsigned long long unsignedLongLongParam = 88;
    float floatParam = 1212;
    double doubleParam = 1313;
    BOOL boolParam = YES;
    int(^blockParam)(int, int) = ^int(int a, int b) { return a + b;};
    CGRect rectParam = CGRectMake(10, 20, 30, 40);
    CGSize sizeParam = CGSizeMake(100, 200);
    char *charPointer = "pcharStr";
    int intValue = 100;
    int *intPointer = &intValue;
    Class classParam = [MZEncode class];
    NSString *nsstringParam = @"nsstring value";
    NSArray *nsarrayParam = @[@3, @"str4"];
    NSDictionary *nsdictionary = @{@"strkey":@[@2, @3]};
    CGRect rectValue = CGRectMake(10, 10, 10, 10);
    CGRect *pRectValue = &rectValue;
    NSString *returnValue = @"return string value";
    
    [invocation setArgument:&charParam atIndex:2];//char
    [invocation setArgument:&unsignedCharParam atIndex:3];//unsigned char
    [invocation setArgument:&shortParam atIndex:4];//short
    [invocation setArgument:&unsignedShortParam atIndex:5];//unsigned short
    [invocation setArgument:&intParam atIndex:6];//int
    [invocation setArgument:&unsignedIntParam atIndex:7];
    [invocation setArgument:&longParam atIndex:8];//long
    [invocation setArgument:&unsignedLongParam atIndex:9];
    [invocation setArgument:&longLongParam atIndex:10];//long long
    [invocation setArgument:&unsignedLongLongParam atIndex:11];
    [invocation setArgument:&floatParam atIndex:12];//float
    [invocation setArgument:&doubleParam atIndex:13];//double
    [invocation setArgument:&boolParam atIndex:14];//BOOL
    [invocation setArgument:&blockParam atIndex:15];//block
    [invocation setArgument:&rectParam atIndex:16];
    [invocation setArgument:&sizeParam atIndex:17];
    [invocation setArgument:&charPointer atIndex:18];
    [invocation setArgument:&intPointer atIndex:19];
    [invocation setArgument:&classParam atIndex:20];
    [invocation setArgument:&nsstringParam atIndex:21];
    [invocation setArgument:&nsarrayParam atIndex:22];
    [invocation setArgument:&nsdictionary atIndex:23];
    [invocation setArgument:&pRectValue atIndex:24];
    [invocation invoke];
    [invocation getReturnValue:&returnValue];
    
    MZLog(returnValue);
    
    [self testEncodeChar];
}

+ (void)testEncodeChar
{
    NSLog(@"int              : %s", @encode(int));
    NSLog(@"int *            : %s", @encode(int*));
    NSLog(@"unsigned int     : %s", @encode(int));
    NSLog(@"float            : %s", @encode(float));
    NSLog(@"float *          : %s", @encode(float*));
    NSLog(@"char             : %s", @encode(char));
    NSLog(@"char *           : %s", @encode(char *));
    NSLog(@"BOOL             : %s", @encode(BOOL));
    NSLog(@"void             : %s", @encode(void));
    NSLog(@"void *           : %s", @encode(void *));
    NSLog(@"NSString *       : %s", @encode(NSString *));
    NSLog(@"NSObject *       : %s", @encode(NSObject *));
    NSLog(@"NSArray[]        : %s", @encode(typeof(@[@"str"])));
    NSLog(@"id               : %s", @encode(id));
    NSLog(@"NSObject         : %s", @encode(NSObject));
    NSLog(@"[NSObject class] : %s", @encode(typeof([NSObject class])));
    NSLog(@"NSError **       : %s", @encode(typeof(NSError **)));
    int intArray[5] = {1, 2, 3, 4, 5};
    NSLog(@"int[]            : %s", @encode(typeof(intArray)));
    float floatArray[3] = {0.1f, 0.2f, 0.3f};
    NSLog(@"float[]          : %s", @encode(typeof(floatArray)));
    
    typedef struct _struct {
        short a;
        long long b;
        unsigned long long c;
    } Struct;
    NSLog(@"struct       : %s", @encode(typeof(Struct)));
}

@end
