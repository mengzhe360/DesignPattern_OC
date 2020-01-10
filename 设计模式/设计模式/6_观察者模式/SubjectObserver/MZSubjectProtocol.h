
//
//  MZSubjectProtocol.h
//  设计模式
//
//  Created by 孟哲 on 2020/1/9.
//  Copyright © 2020 孟哲. All rights reserved.
//

#ifndef MZSubjectProtocol_h
#define MZSubjectProtocol_h
#import "MZObserverProtocol.h"

@class MZObserverClass;

@protocol MZSubjectProtocol <NSObject>

@optional

- (void)addObserver:(MZObserverClass *)observer;

- (void)deleteObserver:(MZObserverClass *)observer;

- (void)postNotifyObervers;

@end


#endif /* MZSubjectProtocol_h */
