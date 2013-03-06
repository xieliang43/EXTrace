//
//  XLDao.m
//  EXTrace
//
//  Created by xie liang on 3/6/13.
//  Copyright (c) 2013 xieliang. All rights reserved.
//

#import "XLDao.h"

@implementation XLDao

- (id)init
{
    self = [super init];
    if (self) {
        fmdb = [[FMDatabase alloc] initWithPath:[XLTools dbPath]];
    }
    return self;
}

@end
