//
//  XLExpressService.h
//  EXTrace
//
//  Created by xie liang on 3/8/13.
//  Copyright (c) 2013 xieliang. All rights reserved.
//

#import "XLService.h"
#import "XLExpress.h"
#import "XLExpressDao.h"

@interface XLExpressService : XLService
{
    __strong XLExpressDao *dao;
}

- (BOOL)saveExpress:(XLExpress *)express;
- (NSArray *)getAllExpress;
- (BOOL)deleteExpress:(XLExpress *)express;

@end
