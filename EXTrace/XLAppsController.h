//
//  XLAppsController.h
//  EXTrace
//
//  Created by xie liang on 3/21/13.
//  Copyright (c) 2013 xieliang. All rights reserved.
//

#import "XLViewController.h"
#import "YouMiWall.h"
#import "YouMiWallAppModel.h"
#import "MBProgressHUD.h"
#import "OpenUDID.h"
#import "XLAppsCell.h"

@interface XLAppsController : XLViewController<YouMiWallDelegate,UITableViewDataSource,UITableViewDelegate>
{
    YouMiWall *wall;
    UITableView *_tableView;
    NSMutableArray *_apps;
}

@end
