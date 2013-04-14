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

- (int)findScore
{
    if (![fmdb open]) {
        Debug(@"could not open db!");
    }
    
    int score = 0;
    
    [fmdb setShouldCacheStatements:YES];
    
    FMResultSet *rs = [fmdb executeQuery:@"select * from system_info where key = 'score'"];
    
    while ([rs next]) {
        score = [rs intForColumn:@"value"];
    }
    
    [rs close];
    [fmdb close];
    
    return score;
}

- (BOOL)updateScore:(int)score
{
    if (![fmdb open]) {
        Debug(@"could not open db!");
    }
    
    [fmdb setShouldCacheStatements:YES];
    
    BOOL result = [fmdb executeUpdate:@"update system_info set value = '%d' where key = 'score' ",score];
    
    return result;
}

@end
