//
//  XLShowExpressInfoController.h
//  EXTrace
//
//  Created by xie liang on 3/8/13.
//  Copyright (c) 2013 xieliang. All rights reserved.
//

#import "XLViewController.h"
#import "XLExpress.h"
#import "XLCompanyService.h"
#import "XLExpressCompany.h"

@interface XLShowExpressInfoController : XLViewController
{
    __strong XLExpressCompany *_company;
}

@property (nonatomic,strong) XLExpress *express;

@end
