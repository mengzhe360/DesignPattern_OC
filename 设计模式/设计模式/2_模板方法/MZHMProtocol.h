
//
//  MZHMProtocol.h
//  设计模式
//
//  Created by 孟哲 on 2020/1/6.
//  Copyright © 2020 孟哲. All rights reserved.
//

#ifndef MZHMProtocol_h
#define MZHMProtocol_h

@protocol MZHMProtocol <NSObject>

- (void)start;
- (void)engineBoom;
- (void)alarm;
- (void)stop;

@end

#endif /* MZHMProtocol_h */
