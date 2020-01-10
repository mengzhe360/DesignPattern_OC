
//
//  MZSubscriptionServiceCenterProtocol.h
//  设计模式
//
//  Created by A5 on 2020/1/10.
//  Copyright © 2020 孟哲. All rights reserved.
//

#ifndef MZSubscriptionServiceCenterProtocol_h
#define MZSubscriptionServiceCenterProtocol_h

@protocol MZSubscriptionServiceCenterProtocol <NSObject>

/**
 *  接收到的订阅信息
 *
 *  @param message            订阅信息
 *  @param subscriptionNumber 订阅编号
 */
- (void)subscriptionMessage:(id)message subscriptionNumber:(NSString *)subscriptionNumber;


@end


#endif /* MZSubscriptionServiceCenterProtocol_h */
