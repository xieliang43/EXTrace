//
//  AdsMogoNetworkAppDriverAdapter.m
//  TestIntegralWall
//
//  Created by Mogo on 12-12-26.
//  Copyright (c) 2012年 Mogo. All rights reserved.
//

#import "AdsMogoNetworkAppDriverAdapter.h"

@implementation AdsMogoNetworkAppDriverAdapter
+(void)load{
    [[AdsMoGoAdWallNetworkRegistry sharedRegistry] registerClass:self];
}

+(AdsMogoNetworkType)getAdsMogoNetworkType{
    return AdsMogoNetworkAppDriver;
}

-(void)getAdWall{
    NSString *mediaId = nil;
    if ([[configAdapter objectForKey:@"key"] objectForKey:@"mediaID"]) {
        mediaId = [[configAdapter objectForKey:@"key"] objectForKey:@"mediaID"];
    }else{
        mediaId = nil;
    }
    
    powerWallViewController = [[ADCPowerWallViewController initWithSiteId:[[configAdapter objectForKey:@"key"] objectForKey:@"siteID"]
                                                                  siteKey:[[configAdapter objectForKey:@"key"] objectForKey:@"siteKEY"]
                                                                  mediaId:mediaId
                                                           userIdentifier:@"currentUser"
                                                               useSandBox:NO
                                                                useReward:YES
                                          powerWallViewControllerDelegate:self] retain];
}

-(void)showAdWall{
    NSString *mediaId = nil;
    if ([[configAdapter objectForKey:@"key"] objectForKey:@"mediaID"]) {
        mediaId = [[configAdapter objectForKey:@"key"] objectForKey:@"mediaID"];
    }else{
        mediaId = nil;
    }
    [ADCPowerWallViewController showPowerWallViewFromViewController:((UIViewController *)[wallDelegate adsWallNeedController])
                                                             siteId:[[configAdapter objectForKey:@"key"] objectForKey:@"siteID"]
                                                            siteKey:[[configAdapter objectForKey:@"key"] objectForKey:@"siteKEY"]
                                                            mediaId:mediaId
                                                     userIdentifier:@"currentUser"
                                                          useReward:YES
                                                         useSandBox:NO];
    [adsMogoCore didSuccessOpenWall:configAdapter];
}

-(void)getPoint{
    [powerWallViewController getScore];
}

-(void)dealloc{
    if(powerWallViewController){
        [powerWallViewController release];
        powerWallViewController = nil;
    }
    [super dealloc];
}

- (void)getScoreFinished:(CGFloat)totalScore{
    [pointDelegate didGetPoint:totalScore andNetworkAdapterType:AdsMogoNetworkAppDriver];
}

- (void)getScoreFailed:(ADCError *)error{
    [pointDelegate didFaildGetPointNetworkAdapterType:AdsMogoNetworkAppDriver];
}

@end
