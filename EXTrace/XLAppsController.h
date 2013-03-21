//
//  XLAppsController.h
//  EXTrace
//
//  Created by xie liang on 3/21/13.
//  Copyright (c) 2013 xieliang. All rights reserved.
//

#import "XLViewController.h"
#import "YouMiWall.h"
#import "MBProgressHUD.h"

@interface XLAppsController : XLViewController<YouMiWallDelegate>
{
    YouMiWall *wall;
}

@end
