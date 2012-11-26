//
//  XLFormDataRequest.m
//  EXTrace
//
//  Created by liang xie on 11/26/12.
//  Copyright (c) 2012 xieliang. All rights reserved.
//

#import "XLFormDataRequest.h"

@implementation XLFormDataRequest

+ (id)requestWithURL:(NSURL *)newURL
{
	XLFormDataRequest *req = [[[self alloc] initWithURL:newURL] autorelease];
    if (req) {
        req.requestMethod = @"POST";
        [req addPostValue:@"4c1f60126fbb2f59" forKey:@"id"];
        [req addPostValue:@"1" forKey:@"muti"];
        [req addPostValue:@"desc" forKey:@"order"];
        [req addPostValue:@"0" forKey:@"show"];
    }
    return req;
}

@end
