//
//  MZMementoTool.m
//  设计模式
//
//  Created by A5 on 2020/1/14.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "MZMementoTool.h"

static  NSMutableDictionary  *_stateMDict = nil;

@implementation MZMementoTool

+ (void)initialize {
    
    if (self == [MZMementoTool class]) {
        
        _stateMDict = [NSMutableDictionary dictionary];
    }
}

+ (NSDictionary *)backupProp:(id)object
{
    MZLog(object)
    return [self getAllPropertiesAndVaules:object];
}

+ (void)restoreProp:(id)object map:(NSDictionary *)map
{
    NSDictionary *nowMap = [self getAllPropertiesAndVaules:object];//现在的

    MZLog(nowMap)
    
    [map enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        if ([nowMap.allKeys containsObject:key]) {
            if ([object valueForKey:key]) {
                [object setValue:obj forKey:key];
            }
        }
    }];
    
    MZLog([self getAllPropertiesAndVaules:object])
    
}

+ (NSDictionary *)backupProp:(id)object atState:(NSString *)state
{
 
    MZLog(object)
    
    [_stateMDict setObject:[self getAllPropertiesAndVaules:object] forKey:state];
    MZLog(_stateMDict.copy)
    return _stateMDict.copy;
    
}

+ (void)restoreProp:(id)object map:(NSDictionary *)map atState:(NSString *)state
{
    MZLog(object)
    NSDictionary *stateDict = nil;
    if (state == nil || state.length <= 0) {//初始值
        if (map.count == 0) {
            MZLog(@"数据没有初始化")
            return;
        }else{
            stateDict = map;
        }
    }else{
         stateDict = [_stateMDict objectForKey:state];//保存state节点的数据
    }

    NSDictionary *nowMap = [self getAllPropertiesAndVaules:object];//现在的
    
    [stateDict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        if ([nowMap.allKeys containsObject:key]) {
            if ([object valueForKey:key]) {
                [object setValue:obj forKey:key];
            }
        }
    }];
    
    MZLog([self getAllPropertiesAndVaules:object])
    
}




@end
