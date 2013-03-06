//
//  XLTools.m
//  EXTrace
//
//  Created by liang xie on 11/26/12.
//  Copyright (c) 2012 xieliang. All rights reserved.
//

#import "XLTools.h"

@implementation XLTools

+ (NSString *)dbPath
{
    return [[NSBundle mainBundle] pathForResource:@"express" ofType:@"sqlite"];
}

@end
