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
#import "YouMiWall.h"
#import "YouMiConfig.h"
#import "OpenUDID.h"

@interface XLAppDelegate : UIResponder <UIApplicationDelegate,iRateDelegate,YouMiWallDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) YouMiWall *wall;

@end
