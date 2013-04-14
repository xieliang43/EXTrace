//
//  XLSystemInfoDao.m
//  EXTrace
//
//  Created by xie liang on 4/14/13.
//  Copyright (c) 2013 xieliang. All rights reserved.
//

#import "XLSystemInfoDao.h"

@implementation XLSystemInfoDao

- (NSDictionary*)findAllSystemInfo
{
    if (![fmdb open]) {
        Debug(@"could not open db!");
    }
    
    [fmdb setShouldCacheStatements:YES];
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    
    FMResultSet *rs = [fmdb executeQuery:@"select * from system_info"];
    
    while ([rs next]) {
        NSString *key = [rs stringForColumn:@"key"];
        NSString *value = [rs stringForColumn:@"value"];
        
        [dic setObject:value forKey:key];
    }
    
    [rs close];
    [fmdb close];
    
    return dic;
}

@end
