//
//  XLTools.h
//  EXTrace
//
//  Created by liang xie on 11/26/12.
//  Copyright (c) 2012 xieliang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XLTools : NSObject

+ (NSString *)documentPath;
+ (NSString *)dbPath;
+ (void)copyDbToPath;

@end
