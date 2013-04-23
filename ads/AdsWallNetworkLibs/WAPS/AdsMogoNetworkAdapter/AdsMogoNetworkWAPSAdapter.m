//
//  AdsMogoNetworkWAPSAdapter.m
//  TestIntegralWall
//
//  Created by Mogo on 12-12-26.
//  Copyright (c) 2012年 Mogo. All rights reserved.
//

#import "AdsMogoNetworkWAPSAdapter.h"

@implementation AdsMogoNetworkWAPSAdapter
+(void)load{
    [[AdsMoGoAdWallNetworkRegistry sharedRegistry] registerClass:self];
}

+(AdsMogoNetworkType)getAdsMogoNetworkType{
    return AdsMogoNetworkWAPS;
}

-(void)getAdWall{
    ifReturnResult = YES;
    [AppConnect getConnect:[configAdapter objectForKey:@"key"]];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onConnectSuccess:) name:WAPS_CONNECT_SUCCESS object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onConnectFailed:) name:WAPS_CONNECT_FAILED object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(getUpdatedPoints:)
                                                 name:WAPS_GET_POINTS_SUCCESS
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(getUpdatedPointsFailed:)
                                                 name:WAPS_GET_POINTS_FAILED
                                               object:nil];
    
    //获取Offer关闭事件的回调方法
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(onOfferClosed:)
                                                 name:WAPS_OFFER_CLOSED
                                               object:nil];
}

//notifycation
-(void)onConnectSuccess:(NSNotification*)notifyObj{
}

-(void)onConnectFailed:(NSNotification*)notifyObj{
}

-(void)getUpdatedPoints:(NSNotification*)notifyObj{
    if (!ifReturnResult) {
        WapsUserPoints *userPointsObj = notifyObj.object;
        int  pointsValue=[userPointsObj getPointsValue];
        [pointDelegate didGetPoint:pointsValue andNetworkAdapterType:AdsMogoNetworkWAPS];
        ifReturnResult = YES;
    }
    
}

-(void)getUpdatedPointsFailed:(NSNotification*)notifyObj{
    if (!ifReturnResult) {
        [pointDelegate didFaildGetPointNetworkAdapterType:AdsMogoNetworkWAPS];
        ifReturnResult = YES;
    }
    
}

-(void)onOfferClosed:(NSNotification*)notifyObj{
}

-(void)showAdWall{
    [AppConnect showOffers:((UIViewController *)[wallDelegate adsWallNeedController])];
    [adsMogoCore didSuccessOpenWall:configAdapter];
}

-(void)getPoint{
    ifReturnResult = NO;
    [AppConnect getPoints];
}

-(void)spendPoint:(NSInteger)aPoint{
}

@end
