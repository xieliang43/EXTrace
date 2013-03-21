//
//  XLAboutController.h
//  EXTrace
//
//  Created by xie liang on 3/6/13.
//  Copyright (c) 2013 xieliang. All rights reserved.
//

#import "XLViewController.h"
#import <MessageUI/MessageUI.h>
#import "XLAppsController.h"
#import "YouMiWall.h"
#import "MBProgressHUD.h"

@interface XLAboutController : XLViewController<MFMailComposeViewControllerDelegate,UINavigationControllerDelegate,YouMiWallDelegate>
{
    YouMiWall *wall;
}

@property (nonatomic,weak) IBOutlet UITableView *tableView;

@end
