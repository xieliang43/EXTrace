//
//  XLAllExpressController.h
//  EXTrace
//
//  Created by xie liang on 3/6/13.
//  Copyright (c) 2013 xieliang. All rights reserved.
//

#import "XLViewController.h"
#import "XLCompanyService.h"
#import "XLAllCompanyCell.h"
#import "XLAddExpressController.h"

@interface XLAllExpressController : XLViewController<XLAllCompanyCellDelegate>
{
    XLCompanyService *service;
    NSArray *companys;
}

@property (nonatomic,weak) IBOutlet UITableView *tableView;

@end
