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

@synthesize mogoWall = _mogoWall;

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
    
    //积分墙
    _mogoWall = [[AdsMogoIntegralWall alloc] initWallWithDelegate:self AndAppId:MOGO_KEY];
    
    //umeng统计
    [MobClick startWithAppkey:UMENG_KEY reportPolicy:BATCH channelId:nil];
    
#ifdef FREE_VERSION
    [MobClick updateOnlineConfig];
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

#pragma mark - AdsMogoIntegralWallDelegate
//您需要将一个viewcontroller作为返回值
-(id)adsWallNeedController{
    return [[UIViewController alloc] init];
}

//取积分操作回调，返回总积分
-(void)didGetThePoint:(int)aPoint{
    NSLog(@"%s",__FUNCTION__);
}

//刷新积分操作回调，返回总积分
-(void)didRefreshThePoint:(int)aPoint{
    NSLog(@"%s,aPoint-->%d",__FUNCTION__,aPoint);
}

//加减积分的回调，aPoint返回总积分 aCpoint是改变的积分数(加10分返回的aCpoint就是10,减10分返回的就是-10)
-(void)didChangedThePoint:(int)aPoint andChangedPoint:(int)aCpoint{
    NSLog(@"%s",__FUNCTION__);
}

//获取用户在mogo的配置完成
-(void)didReceiveMogoWallConfig{
    [[UIApplication sharedApplication]setNetworkActivityIndicatorVisible:NO];
}

//后台配置按顺序展示的时候，当您调用showWall时回调，返回一个数组，数组成员是每个平台的信息字典
-(void)showWallByPriority:(NSArray *)configs{
    
}

//当无法从网上获取配置信息的时候回调，失败展示积分墙
-(void)didFailedGetWall:(NSString *)error{
    
}

//展示积分墙回调，成功展示积分墙
-(void)didSuccessOpenWall:(NSDictionary *)config{
    
}

@end
