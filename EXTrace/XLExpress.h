//
//  XLExpress.h
//  EXTrace
//
//  Created by xie liang on 3/6/13.
//  Copyright (c) 2013 xieliang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XLExpress : NSObject

@property (nonatomic,assign) NSInteger eid;
@property (nonatomic,assign) NSInteger companyId;
@property (nonatomic,strong) NSString *expressNo;
@property (nonatomic,strong) NSString *description;
@property (nonatomic,strong) NSString *infomation;

@end
