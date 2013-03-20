//
//  XLSiteController.h
//  EXTrace
//
//  Created by xie liang on 3/6/13.
//  Copyright (c) 2013 xieliang. All rights reserved.
//

#import "XLViewController.h"
#import "XLCompanyService.h"
#import "XLExpressCompany.h"
#import "XLSiteCell.h"
#import "XLEditCompanyController.h"

@interface XLSiteController : XLViewController
{
    XLCompanyService *service;
    NSMutableArray *companys;
}

@property (nonatomic,weak) IBOutlet UITableView *tableView;

@end
