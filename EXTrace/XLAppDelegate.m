//
//  XLAppDelegate.m
//  EXTrace
//
//  Created by xie liang on 11/26/12.
//  Copyright (c) 2012 xieliang. All rights reserved.
//

#import "XLAppDelegate.h"
#import "XLFormDataRequest.h"
#import "XLPopExpressController.h"
#import "XLAllExpressController.h"
#import "XLMyExpressController.h"
#import "XLSiteController.h"
#import "XLAboutController.h"

@implementation XLAppDelegate

@synthesize wall = _wall;

+ (void)initialize
{
    [iRate sharedInstance].applicationBundleID = BundleID;
	[iRate sharedInstance].onlyPromptIfLatestVersion = NO;
    
    [iRate sharedInstance].usesUntilPrompt = 3;
    [iRate sharedInstance].daysUntilPrompt = 0;
    [iRate sharedInstance].remindPeriod = 0;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //准备数据库文件
    [XLTools copyDbToPath];
    
    //umeng统计
    [MobClick startWithAppkey:UMENG_KEY reportPolicy:BATCH channelId:nil];
#ifdef FREE_VERSION
    [MobClick updateOnlineConfig];
    _wall = [[YouMiWall alloc] initWithAppID:YOUMI_KEY withAppSecret:YOUMI_SECRET];
    _wall.delegate = self;
    [_wall requestFeaturedApp:YES];
#endif
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    XLPopExpressController *popExpressCon = [[XLPopExpressController alloc] initWithNibName:@"XLPopExpressController" bundle:nil];
    UINavigationController *navCon = [[UINavigationController alloc] initWithRootViewController:popExpressCon];
    navCon.navigationBar.tintColor = NAVI_COLOR;
    
    XLAllExpressController *allExpressCon = [[XLAllExpressController alloc] initWithNibName:@"XLAllExpressController" bundle:nil];
    UINavigationController *navCon1 = [[UINavigationController alloc] initWithRootViewController:allExpressCon];
    navCon1.navigationBar.tintColor = NAVI_COLOR;
    
    XLMyExpressController *myExpressCon = [[XLMyExpressController alloc] initWithNibName:@"XLMyExpressController" bundle:nil];
    UINavigationController *navCon2 = [[UINavigationController alloc] initWithRootViewController:myExpressCon];
    navCon2.navigationBar.tintColor = NAVI_COLOR;
    
    XLSiteController *siteCon = [[XLSiteController alloc] initWithNibName:@"XLSiteController" bundle:nil];
    UINavigationController *navCon3 = [[UINavigationController alloc] initWithRootViewController:siteCon];
    navCon3.navigationBar.tintColor = NAVI_COLOR;
    
    XLAboutController *aboutCon = [[XLAboutController alloc] initWithNibName:@"XLAboutController" bundle:nil];
    UINavigationController *navCon4 = [[UINavigationController alloc] initWithRootViewController:aboutCon];
    navCon4.navigationBar.tintColor = NAVI_COLOR;
    
    NSArray *array = [NSArray arrayWithObjects:navCon,navCon1,navCon2,navCon3,navCon4,nil];
    
    XLTabBarController *tabControler = [[XLTabBarController alloc] init];
    
    tabControler.controllers = array;
    tabControler.selectIndex = 2;
    
    self.window.rootViewController = tabControler;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - YouMiWall delegate

- (void)didReceiveFeaturedApp:(YouMiWall *)adWall {
    
    [adWall showFeaturedApp];
     
}

- (void)didFailToReceiveFeaturedApp:(YouMiWall *)adWall error:(NSError *)error {
    
}

@end
