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
#import "XLFormDataRequest.h"
#import "NSString+SBJSON.h"
#import "XLExpressInfoCell.h"
#import "MBProgressHUD.h"

@interface XLShowExpressInfoController : XLViewController
{
    XLExpressCompany *_company;
    NSArray *_dataArray;
}

@property (nonatomic,strong) XLExpress *express;
@property (nonatomic,weak) IBOutlet UITableView *tableView;

@end
