//
//  XLComanyService.h
//  EXTrace
//
//  Created by xie liang on 3/8/13.
//  Copyright (c) 2013 xieliang. All rights reserved.
//

#import "XLService.h"
#import "XLExpressCompanyDao.h"

@interface XLCompanyService : XLService
{
    __strong XLExpressCompanyDao *dao;
}

- (NSArray *)getAllCompany;

@end
