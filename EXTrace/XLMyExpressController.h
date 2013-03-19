//
//  XLMyExpressController.h
//  EXTrace
//
//  Created by xie liang on 3/6/13.
//  Copyright (c) 2013 xieliang. All rights reserved.
//

#import "XLViewController.h"
#import "XLAddExpressController.h"
#import "YouMiView.h"
#import "XLExpress.h"
#import "XLExpressService.h"
#import "XLShowExpressInfoController.h"
#import "XLExpressCell.h"

@interface XLMyExpressController : XLViewController<YouMiDelegate,UITableViewDataSource,UITableViewDelegate>
{
    __strong NSMutableArray *myExpresses;
    __strong XLExpressService *service;
}

@property (nonatomic,assign) IBOutlet UITableView *tableView;

@end
