//
//  MZMementoTool.m
//  设计模式
//
//  Created by A5 on 2020/1/14.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "MZMementoTool.h"

@implementation MZMementoTool

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
//            [map setValue:obj forKey:key];
            if ([object valueForKey:key]) {
                [object setValue:obj forKey:key];
            }
        }
    }];
    
    MZLog([self getAllPropertiesAndVaules:object])
    
}



@end
