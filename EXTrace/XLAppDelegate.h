//
//  XLAppDelegate.h
//  EXTrace
//
//  Created by xie liang on 11/26/12.
//  Copyright (c) 2012 xieliang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MobClick.h"
#import "XLTabBarController.h"
#import "iRate.h"
#import "OpenUDID.h"
#import "XLSystemInfoDao.h"

@interface XLAppDelegate : UIResponder <UIApplicationDelegate,iRateDelegate>
{
    NSTimer *timer;
    XLSystemInfoDao *dao;
}

@property (strong, nonatomic) UIWindow *window;

@end
