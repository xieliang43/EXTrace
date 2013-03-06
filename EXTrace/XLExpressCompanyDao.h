//
//  XLExpressCompanyDao.h
//  EXTrace
//
//  Created by xie liang on 3/6/13.
//  Copyright (c) 2013 xieliang. All rights reserved.
//

#import "XLDao.h"
#import "XLExpressCompany.h"

@interface XLExpressCompanyDao : XLDao

- (NSArray *)findAllExpressCompany;
- (XLExpressCompany *)findExpressCompanyById:(NSInteger)cid;
- (BOOL)updateExpressCompany:(XLExpressCompany *)company;

@end
