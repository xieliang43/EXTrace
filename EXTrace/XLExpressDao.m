//
//  XLExpressDao.m
//  EXTrace
//
//  Created by xie liang on 3/6/13.
//  Copyright (c) 2013 xieliang. All rights reserved.
//

#import "XLExpressDao.h"

@implementation XLExpressDao

- (BOOL)addExpress:(XLExpress*)express
{
    if (![fmdb open]) {
        Debug(@"could not open db!");
    }
    
    [fmdb setShouldCacheStatements:YES];
    
    NSString *sqlStr = [NSString stringWithFormat:@"insert into my_express(companyId,expressNo,description) values (%d,'%@','%@')",express.companyId,express.expressNo,express.description];
    BOOL result = [fmdb executeUpdateWithFormat:sqlStr];
    
    [fmdb close];
    
    return result;
}

- (NSArray*)findAllExpress
{
    if (![fmdb open]) {
        Debug(@"could not open db!");
    }
    
    [fmdb setShouldCacheStatements:YES];
    
    NSMutableArray *array = [NSMutableArray array];
    
    FMResultSet *rs = [fmdb executeQuery:@"select * from my_express"];
    
    while ([rs next]) {
        XLExpress *express = [[XLExpress alloc] init];
        express.eid = [rs intForColumn:@"eid"];
        express.companyId = [rs intForColumn:@"companyId"];
        express.expressNo = [rs stringForColumn:@"expressNo"];
        express.infomation = [rs stringForColumn:@"infomation"];
        express.description = [rs stringForColumn:@"description"];
        
        [array addObject:express];
    }
    
    [rs close];
    [fmdb close];
    
    return array;
}

- (BOOL)deleteExpressById:(NSInteger)eid
{
    if (![fmdb open]) {
        Debug(@"could not open db!");
    }
    
    [fmdb setShouldCacheStatements:YES];
    
    BOOL result = [fmdb executeUpdateWithFormat:@"delete from my_express where eid = %d",eid];
    
    [fmdb close];
    
    return result;
}

- (BOOL)updateExpress:(XLExpress*)express
{
    if (![fmdb open]) {
        Debug(@"could not open db!");
    }
    
    [fmdb setShouldCacheStatements:YES];
    
    BOOL result = [fmdb executeUpdateWithFormat:@"update my_express set companyId = %d,expressNo = '%@',infomation = '%@',description = '%@' where eid = %d",express.companyId,express.expressNo,express.infomation,express.description,express.eid];
    
    [fmdb close];
    
    return result;
}

@end
