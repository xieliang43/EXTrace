//
//  XLExpressDao.h
//  EXTrace
//
//  Created by xie liang on 3/6/13.
//  Copyright (c) 2013 xieliang. All rights reserved.
//

#import "XLDao.h"
#import "XLExpress.h"

@interface XLExpressDao : XLDao

- (BOOL)addExpress:(XLExpress*)express;
- (NSArray*)findAllExpress;
- (BOOL)deleteExpressById:(NSInteger)eid;
- (BOOL)updateExpress:(XLExpress*)express;

@end
