//
//  XLExpressCompanyDao.m
//  EXTrace
//
//  Created by xie liang on 3/6/13.
//  Copyright (c) 2013 xieliang. All rights reserved.
//

#import "XLExpressCompanyDao.h"

@implementation XLExpressCompanyDao

- (NSArray *)findAllExpressCompany
{
    NSMutableArray *array = [NSMutableArray array];
    
    if (![fmdb open]) {
        Debug(@"could not open db");
        return nil;
    }
    
    [fmdb setShouldCacheStatements:YES];
    
    FMResultSet *rs = [fmdb executeQuery:@"select * from express_info"];
    
    while ([rs next]) {
        XLExpressCompany *company = [[XLExpressCompany alloc] init];
        company.cid = [rs intForColumn:@"cid"];
        company.name = [rs stringForColumn:@"name"];
        company.code = [rs stringForColumn:@"code"];
        company.image = [rs stringForColumn:@"image"];
        company.phone = [rs stringForColumn:@"phone"];
        company.site = [rs stringForColumn:@"site"];
        company.isCommon = [rs stringForColumn:@"is_common"];
        
        [array addObject:company];
    }
    
    [rs close];
    [fmdb close];
    
    return array;
}

- (XLExpressCompany *)findExpressCompanyById:(NSInteger)cid
{
    XLExpressCompany *company = [[XLExpressCompany alloc] init];
    
    if (![fmdb open]) {
        Debug(@"could not open db");
        return nil;
    }
    
    [fmdb setShouldCacheStatements:YES];
    
    FMResultSet *rs = [fmdb executeQueryWithFormat:@"select * from express_info where cid = %d",cid];
    
    while ([rs next]) {
        company.cid = [rs intForColumn:@"cid"];
        company.name = [rs stringForColumn:@"name"];
        company.code = [rs stringForColumn:@"code"];
        company.image = [rs stringForColumn:@"image"];
        company.phone = [rs stringForColumn:@"phone"];
        company.site = [rs stringForColumn:@"site"];
        company.isCommon = [rs stringForColumn:@"is_common"];
    }
    
    [rs close];
    [fmdb close];
    
    return company;
}

- (BOOL)updateExpressCompany:(XLExpressCompany *)company
{
    if (![fmdb open]) {
        Debug(@"could not open db");
        return nil;
    }
    
    [fmdb setShouldCacheStatements:YES];
    
    BOOL result = [fmdb executeUpdateWithFormat:@"update express_info set is_common = %@",company.isCommon];
    
    [fmdb close];
    
    return result;
}

@end
