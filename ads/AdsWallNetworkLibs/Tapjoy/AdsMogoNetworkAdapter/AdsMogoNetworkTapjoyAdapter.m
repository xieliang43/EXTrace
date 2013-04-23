//
//  AdsMogoNetworkTapjoyAdapter.m
//  TestIntegralWall
//
//  Created by Mogo on 12-12-25.
//  Copyright (c) 2012年 Mogo. All rights reserved.
//

#import "AdsMogoNetworkTapjoyAdapter.h"

@implementation AdsMogoNetworkTapjoyAdapter

+(void)load{
    [[AdsMoGoAdWallNetworkRegistry sharedRegistry] registerClass:self];
}

+(AdsMogoNetworkType)getAdsMogoNetworkType{
    return AdsMogoNetworkTapjoy;
}

-(void)getAdWall{
    isGetPoint = NO;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tjcConnectSuccess:) name:TJC_CONNECT_SUCCESS object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tjcConnectFail:) name:TJC_CONNECT_FAILED object:nil];
    [TapjoyConnect requestTapjoyConnect:[[configAdapter objectForKey:@"key"] objectForKey:@"appID"]
							  secretKey:[[configAdapter objectForKey:@"key"] objectForKey:@"secretKey"]
								options:[NSDictionary dictionaryWithObjectsAndKeys:
										 [NSNumber numberWithInt:TJCTransitionExpand], TJC_OPTION_TRANSITION_EFFECT,
										 [NSNumber numberWithBool:YES], TJC_OPTION_ENABLE_LOGGING,
										 [[configAdapter objectForKey:@"key"] objectForKey:@"currencyID"], TJC_OPTION_USER_ID,
										 nil]];
    [[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(getUpdatedPoints:)
												 name:TJC_TAP_POINTS_RESPONSE_NOTIFICATION
											   object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(getVedio:)
												 name:TJC_OPTION_VIDEO_CACHE_COUNT
											   object:nil];
}

-(void)showAdWall{
    
    [TapjoyConnect showOffersWithCurrencyID:[[configAdapter objectForKey:@"key"] objectForKey:@"currencyID"] withViewController:((UIViewController *)[wallDelegate adsWallNeedController]) withCurrencySelector:NO];
    [adsMogoCore didSuccessOpenWall:configAdapter];
}

-(void)getPoint{
    isGetPoint = YES;
    [TapjoyConnect getTapPoints];
}

- (void)getUpdatedPoints:(NSNotification*)notifyObj
{
	NSNumber *tapPoints = notifyObj.object;
//	NSString *tapPointsStr = [NSString stringWithFormat:@"Tap Points: %d", [tapPoints intValue]];
//	NSLog(@"%@", tapPointsStr);
    if (isGetPoint) {
        [pointDelegate didGetPoint:[tapPoints integerValue] andNetworkAdapterType:AdsMogoNetworkTapjoy];
        isGetPoint = NO;
    }

}

- (void)getVedio:(NSNotification*)notifyObj{
    NSNumber *tapPoints = notifyObj.object;
    NSLog(@"~~~%@",tapPoints);
}

- (void)tjcConnectSuccess:(NSNotification*)notifyObj
{
	NSLog(@"Tapjoy connect Succeeded");
}


- (void)tjcConnectFail:(NSNotification*)notifyObj
{
	NSLog(@"Tapjoy connect Failed");
}

- (void)didReceiveAd:(TJCAdView*)adView
{
    //2013-2-20 将
//    [adsMogoCore didSuccessOpenWall:configAdapter];
}


- (void)didFailWithMessage:(NSString*)msg
{
	[adsMogoCore didFailedGetWall:msg];
}

- (NSString*) adContentSize{
    return nil;
}

- (BOOL) shouldRefreshAd{
    return YES;
}
@end
