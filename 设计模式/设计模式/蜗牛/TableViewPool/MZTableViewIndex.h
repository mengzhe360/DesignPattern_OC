//
//  MZTableViewIndex.h
//  设计模式
//
//  Created by 孟哲 on 2020/2/27.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MZTableViewIndexDelegate <NSObject>

// 获取一个tableview的字母索引条数据的方法
- (NSArray <NSString *> *)indexTitlesForIndexTableView:(UITableView *)tableView;

- (void)scrollToRowAtIndexPathOfIndex:(NSInteger)index;

@end

@interface MZTableViewIndex : UITableView

@property (nonatomic, weak) id <MZTableViewIndexDelegate> indexedDataSource;

@end

NS_ASSUME_NONNULL_END
