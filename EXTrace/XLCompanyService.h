//
//  XLComanyService.h
//  EXTrace
//
//  Created by xie liang on 3/8/13.
//  Copyright (c) 2013 xieliang. All rights reserved.
//

#import "XLService.h"
#import "XLExpressCompanyDao.h"
#import "XLExpressCompany.h"

@interface XLCompanyService : XLService
{
    __strong XLExpressCompanyDao *dao;
}

- (NSArray *)getAllCompany;
- (XLExpressCompany *)getExpressCompanyById:(NSInteger)cid;
- (NSArray *)getPopCompany;
- (BOOL)updateCompany:(XLExpressCompany *)company;

@end
