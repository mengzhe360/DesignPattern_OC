//
//  MZElementCollection.m
//  设计模式
//
//  Created by A5 on 2020/1/15.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "MZElementCollection.h"

@interface MZElementCollection ()

@property (nonatomic, strong) NSMutableDictionary  *elementsDictionary;

@end

@implementation MZElementCollection

- (instancetype)init {
    
    self = [super init];
    
    if (self) {
    
        self.elementsDictionary = [NSMutableDictionary dictionary];
    }
    
    return self;
}

- (void)addElement:(id <MZElementProtocol>)element withKey:(NSString *)key {

    NSParameterAssert(element);
    NSParameterAssert(key);
    
    [self.elementsDictionary setObject:element forKey:key];
}

- (NSArray *)allKeys {

    return self.elementsDictionary.allKeys;
}

- (id <MZElementProtocol>)elementWithKey:(NSString *)key {

    NSParameterAssert(key);
    
    return [self.elementsDictionary objectForKey:key];
}


@end
