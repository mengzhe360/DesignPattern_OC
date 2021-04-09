//
//  MZBlockViewController.h
//  设计模式
//
//  Created by A5 on 2020/5/19.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^GesturesVcSetBlock)(BOOL isSuccess,UIViewController * count);//设置

@interface MZBlockViewController : UIViewController

@property (nonatomic,copy) NSString *bStr; 

@property (nonatomic, copy) GesturesVcSetBlock gesturesVcSetBlock;

@end

NS_ASSUME_NONNULL_END
