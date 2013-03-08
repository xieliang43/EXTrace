//
//  XLExpressService.m
//  EXTrace
//
//  Created by xie liang on 3/8/13.
//  Copyright (c) 2013 xieliang. All rights reserved.
//

#import "XLExpressService.h"

@implementation XLExpressService

- (id)init
{
    self = [super init];
    if (self) {
        dao = [[XLExpressDao alloc] init];
    }
    return self;
}

- (BOOL)saveExpress:(XLExpress *)express
{
    return [dao addExpress:express];
}

@end
