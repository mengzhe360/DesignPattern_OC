
//
//  MZSubscriptionServiceCenter.m
//  设计模式
//
//  Created by A5 on 2020/1/10.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "MZSubscriptionServiceCenter.h"

static  NSMutableDictionary  *_subscriptionNumberDictionary = nil;

@implementation MZSubscriptionServiceCenter

+ (void)initialize {
    
    if (self == [MZSubscriptionServiceCenter class]) {
        
        _subscriptionNumberDictionary = [NSMutableDictionary dictionary];
    }
}

+ (void)createSubscriptionNumber:(NSString *)subscriptionNumber {

    NSParameterAssert(subscriptionNumber);
    
    NSHashTable *hashTable = [self existSubscriptionNumber:subscriptionNumber];
    
    if (hashTable == nil) {
        
        hashTable = [NSHashTable weakObjectsHashTable];
        [_subscriptionNumberDictionary setObject:hashTable forKey:subscriptionNumber];
    }
}

+ (void)removeSubscriptionNumber:(NSString *)subscriptionNumber {

    NSParameterAssert(subscriptionNumber);
    
    if ([self existSubscriptionNumber:subscriptionNumber]) {
        
        [_subscriptionNumberDictionary removeObjectForKey:subscriptionNumber];
    }
}

+ (void)removeCustomer:(id <MZSubscriptionServiceCenterProtocol>)customer fromSubscriptionNumber:(NSString *)subscriptionNumber {

    NSParameterAssert(subscriptionNumber);
    
    NSHashTable *hashTable = [self existSubscriptionNumber:subscriptionNumber];
    
    if (hashTable && customer && [hashTable containsObject:customer]) {
        [hashTable removeObject:customer];
    }
}

+ (void)sendMessage:(id)message toSubscriptionNumber:(NSString *)subscriptionNumber {
    
    NSParameterAssert(subscriptionNumber);
    
    NSHashTable *hashTable = [self existSubscriptionNumber:subscriptionNumber];
    
    if (hashTable) {
        
        NSEnumerator *enumerator = [hashTable objectEnumerator];
        
        id <MZSubscriptionServiceCenterProtocol> customer = nil;
        while (customer = [enumerator nextObject]) {
        
            if ([customer respondsToSelector:@selector(subscriptionMessage:subscriptionNumber:)]) {
                [customer subscriptionMessage:message subscriptionNumber:subscriptionNumber];
            }
        }
    }
}

+ (void)addCustomer:(id)customer withSubscriptionNumber:(NSString *)subscriptionNumber {

    NSParameterAssert(customer);
    NSParameterAssert(subscriptionNumber);
    
    NSHashTable *hashTable = [self existSubscriptionNumber:subscriptionNumber];
    [hashTable addObject:customer];
}

+ (NSHashTable *)existSubscriptionNumber:(NSString *)subscriptionNumber {
    
    return [_subscriptionNumberDictionary objectForKey:subscriptionNumber];
}


@end
