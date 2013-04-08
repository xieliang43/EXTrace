//
//  XLTools.m
//  EXTrace
//
//  Created by liang xie on 11/26/12.
//  Copyright (c) 2012 xieliang. All rights reserved.
//

#import "XLTools.h"

@implementation XLTools

+ (NSString *)documentPath
{
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}

+ (NSString *)dbPath
{
    return [NSString stringWithFormat:@"%@/express-1.4.sqlite",[XLTools documentPath]];
}

+ (void)copyDbToPath
{
    NSString *rPath = [[NSBundle mainBundle] pathForResource:@"express-1.4" ofType:@"sqlite"];
    NSString *dPath = [XLTools dbPath];
    
    NSFileManager *manager = [NSFileManager defaultManager];
    if (![manager fileExistsAtPath:dPath]) {
        [manager copyItemAtPath:rPath toPath:dPath error:nil];
    }
}

+ (void)saveConfig:(XLConfig *)config
{
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    [def setObject:config forKey:@"config"];
    [def synchronize];
}

+ (XLConfig *)getConfig
{
    XLConfig *conf = [[NSUserDefaults standardUserDefaults] objectForKey:@"config"];
    if (!conf) {
        conf = [[XLConfig alloc] init];
        conf.isCount = NO;
    }
    return conf;
}


@end
