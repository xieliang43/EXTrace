//
//  XLComanyService.m
//  EXTrace
//
//  Created by xie liang on 3/8/13.
//  Copyright (c) 2013 xieliang. All rights reserved.
//

#import "XLCompanyService.h"

@implementation XLCompanyService

- (id)init
{
    self = [super init];
    if (self) {
        dao = [[XLExpressCompanyDao alloc] init];
    }
    return self;
}

- (NSArray *)getAllCompany
{
    return [dao findAllExpressCompany];
}

@end
