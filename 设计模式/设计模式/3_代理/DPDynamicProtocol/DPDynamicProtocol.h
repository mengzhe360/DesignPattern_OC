//
//  DPDynamicProtocol.h
//  单例释放
//
//  Created by A5 on 2020/1/2.
//  Copyright © 2020 mengzhe. All rights reserved.
//

#ifndef DPDynamicProtocol_h
#define DPDynamicProtocol_h

@protocol DPDynamicProtocol <NSObject>

@required
- (void)doSomething;
- (void)doOtherThing;

@optional

- (void)optionalThing;

@end

#endif /* DPDynamicProtocol_h */
