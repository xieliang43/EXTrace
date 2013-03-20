//
//  XLPopExpressController.h
//  EXTrace
//
//  Created by xie liang on 3/6/13.
//  Copyright (c) 2013 xieliang. All rights reserved.
//

#import "XLViewController.h"
#import "XLCompanyService.h"
#import "XLExpressCompany.h"
#import "XLExpressCompanyCell.h"
#import "XLAddExpressController.h"

@interface XLPopExpressController : XLViewController
{
    XLCompanyService *service;
    NSMutableArray *companys;
}

@property (nonatomic,weak) IBOutlet UITableView *tableView;

@end
