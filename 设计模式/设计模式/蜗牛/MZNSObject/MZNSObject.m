//
//  MZNSObject.m
//  设计模式
//
//  Created by A5 on 2021/3/30.
//  Copyright © 2021 孟哲. All rights reserved.
//

#import "MZNSObject.h"

@implementation MZNSObject

/*
 
 + (void)load {
 }

 + (void)initialize {
 }

 + (id)self {
     return (id)self;
 }

 - (id)self {
     return self;
 }

 + (Class)class {
     return self;
 }

 - (Class)class {
     return object_getClass(self);
 }

 + (Class)superclass {
     return self->superclass;
 }

 - (Class)superclass {
     return [self class]->superclass;
 }

 + (BOOL)isMemberOfClass:(Class)cls {
     return object_getClass((id)self) == cls;
 }

 - (BOOL)isMemberOfClass:(Class)cls {
     return [self class] == cls;
 }

 + (BOOL)isKindOfClass:(Class)cls {
     for (Class tcls = object_getClass((id)self); tcls; tcls = tcls->superclass) {
         if (tcls == cls) return YES;
     }
     return NO;
 }

 - (BOOL)isKindOfClass:(Class)cls {
     for (Class tcls = [self class]; tcls; tcls = tcls->superclass) {
         if (tcls == cls) return YES;
     }
     return NO;
 }

 + (BOOL)isSubclassOfClass:(Class)cls {
     for (Class tcls = self; tcls; tcls = tcls->superclass) {
         if (tcls == cls) return YES;
     }
     return NO;
 }

 + (BOOL)isAncestorOfObject:(NSObject *)obj {
     for (Class tcls = [obj class]; tcls; tcls = tcls->superclass) {
         if (tcls == self) return YES;
     }
     return NO;
 }
 
 */

@end
