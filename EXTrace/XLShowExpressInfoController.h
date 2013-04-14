//
//  XLShowExpressInfoController.h
//  EXTrace
//
//  Created by xie liang on 3/8/13.
//  Copyright (c) 2013 xieliang. All rights reserved.
//

#import "XLViewController.h"
#import <MessageUI/MessageUI.h>
#import <QuartzCore/QuartzCore.h>
#import "XLExpress.h"
#import "XLCompanyService.h"
#import "XLExpressCompany.h"
#import "XLFormDataRequest.h"
#import "NSString+SBJSON.h"
#import "XLExpressInfoCell.h"
#import "MBProgressHUD.h"
#import "YouMiView.h"
#import "YouMiWallBanner.h"
#import "XLSystemInfoDao.h"
#import "XLAppsController.h"

@interface XLShowExpressInfoController : XLViewController<MFMessageComposeViewControllerDelegate,YouMiDelegate,UIAlertViewDelegate>
{
    XLExpressCompany *_company;
    NSArray *_dataArray;
    XLSystemInfoDao *_dao;
}

@property (nonatomic,strong) XLExpress *express;
@property (nonatomic,weak) IBOutlet UITableView *tableView;

@end
