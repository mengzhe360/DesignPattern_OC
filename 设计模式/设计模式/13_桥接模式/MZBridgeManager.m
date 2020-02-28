//
//  MZBridgeManager.m
//  设计模式
//
//  Created by 孟哲 on 2020/2/28.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "MZBridgeManager.h"
#import "MZAlertHandlerAbstract.h"
#import "MZTpsAlertHandler.h"
#import "MZErrorAlertHandler.h"
#import "MZNotificationAbstract.h"
#import "MZSevereNotification.h"
#import "MZUrgencyNotification.h"
#import "MZNormalNotification.h"
#import "MZTrivialNotification.h"
#import "MZTelephoneMsgSender.h"
#import "MZEmailMsgSender.h"
#import "MZWechatMsgSender.h"
#import "MZAlert.h"

@interface MZBridgeManager ()

@property (nonatomic,strong) MZAlert *alert;
@property (nonatomic,strong) MZNotificationAbstract *notification;

@end

@implementation MZBridgeManager

+ (instancetype)sharedInstance
{
    static id _sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] init];
    });
    return _sharedInstance;
}

- (void)initializeBeansData
{
    self.alert = [[MZAlert alloc] init];
    
    MZTelephoneMsgSender *telephone = [[MZTelephoneMsgSender alloc] init];
    telephone.telephones = @[@"188",@"166"];
    
    MZEmailMsgSender *email = [[MZEmailMsgSender alloc] init];
    email.emails = @[@"mz@163",@"mz@qq"];
    
    MZWechatMsgSender *wechat = [[MZWechatMsgSender alloc] init];
    wechat.wechats = @[@"微信A",@"微信B",@"微信C"];
    
    MZSevereNotification *severeNotiA = [[MZSevereNotification alloc] initWithMsgSender:telephone];
    MZSevereNotification *severeNotiB = [[MZSevereNotification alloc] initWithMsgSender:email];
    MZSevereNotification *severeNotiC = [[MZSevereNotification alloc] initWithMsgSender:wechat];
    
    MZUrgencyNotification *urgencyNotiA = [[MZUrgencyNotification alloc] initWithMsgSender:telephone];
    MZUrgencyNotification *urgencyNotiB = [[MZUrgencyNotification alloc] initWithMsgSender:email];
    MZUrgencyNotification *urgencyNotiC = [[MZUrgencyNotification alloc] initWithMsgSender:wechat];
    
    MZNormalNotification *normalNotiA = [[MZNormalNotification alloc] initWithMsgSender:telephone];
    MZNormalNotification *normalNotiB = [[MZNormalNotification alloc] initWithMsgSender:email];
    MZNormalNotification *normalNotiC = [[MZNormalNotification alloc] initWithMsgSender:wechat];
    
    MZTrivialNotification *trivialNotiA = [[MZTrivialNotification alloc] initWithMsgSender:telephone];
    MZTrivialNotification *trivialNotiB = [[MZTrivialNotification alloc] initWithMsgSender:email];
    MZTrivialNotification *trivialNotiC = [[MZTrivialNotification alloc] initWithMsgSender:wechat];
    
    MZAlertHandlerAbstract *tpsHandlerA = [[MZTpsAlertHandler alloc] initWithNotification:severeNotiA];
    MZAlertHandlerAbstract *tpsHandlerB = [[MZTpsAlertHandler alloc] initWithNotification:urgencyNotiB];
    MZAlertHandlerAbstract *tpsHandlerC = [[MZTpsAlertHandler alloc] initWithNotification:normalNotiC];
    
    MZAlertHandlerAbstract *errorHandlerA = [[MZErrorAlertHandler alloc] initWithNotification:trivialNotiA];
    MZAlertHandlerAbstract *errorHandlerB = [[MZErrorAlertHandler alloc] initWithNotification:normalNotiB];
    MZAlertHandlerAbstract *errorHandlerC = [[MZErrorAlertHandler alloc] initWithNotification:severeNotiC];
    
    
    NSArray *handlerArr = @[tpsHandlerA,tpsHandlerB,tpsHandlerC,errorHandlerA,errorHandlerB,errorHandlerC];
    [handlerArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
         [self.alert addAlertHandler:obj];
    }];
    
}

- (MZAlert *)getAlert
{
    [self initializeBeansData];
    
    return self.alert;
}


@end
