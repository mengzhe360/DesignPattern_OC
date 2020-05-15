//
//  MZBaseColleague.h
//  设计模式
//
//  Created by A5 on 2020/5/15.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MZColleagueProtocol.h"
#import "MZMediator.h"

NS_ASSUME_NONNULL_BEGIN

//实际处理业务逻辑的基类

@interface MZBaseColleague : NSObject<MZColleagueProtocol>

@property(nonatomic,strong)MZMediator *mediator;

- (instancetype)initWithMediator:(MZMediator *)mediator;

@end

NS_ASSUME_NONNULL_END
