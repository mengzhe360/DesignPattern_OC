//
//  MZDynamicProtocol.h
//  设计模式
//
//  Created by 孟哲 on 2020/1/7.
//  Copyright © 2020 孟哲. All rights reserved.
//

#ifndef MZDynamicProtocol_h
#define MZDynamicProtocol_h

@protocol MZDynamicProtocol <NSObject>

@required

- (void)doSomething;
- (void)doOtherThing;

@optional

- (void)optionalThing;

@end

#endif /* MZDynamicProtocol_h */
