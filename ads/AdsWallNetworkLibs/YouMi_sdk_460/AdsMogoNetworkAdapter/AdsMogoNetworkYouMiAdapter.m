//
//  AdsMogoNetworkYouMiAdapter.m
//  TestIntegralWall
//
//  Created by Daxiong on 13-2-21.
//  Copyright (c) 2013年 Mogo. All rights reserved.
//

#import "AdsMogoNetworkYouMiAdapter.h"

@implementation AdsMogoNetworkYouMiAdapter
+(void)load{
    [[AdsMoGoAdWallNetworkRegistry sharedRegistry] registerClass:self];
}

+(AdsMogoNetworkType)getAdsMogoNetworkType{
    return AdsMogoNetworkYouMi;
}


-(void)getAdWall{
    wall = [[YouMiWall alloc] initWithAppID:[[configAdapter objectForKey:@"key"] objectForKey:@"AppKey"] withAppSecret:[[configAdapter objectForKey:@"key"] objectForKey:@"SecretKey"]];
    [YouMiWall setShouldCacheImage:YES];

    wall.delegate = self;
    isRequested = NO;
}

-(void)showAdWall{
 
    if (isRequested) {
        [wall showOffers];
    }else{
        [wall requestOffers:YES];
    }
}


-(void)getPoint{
    [wall requestEarnedPoints];
}


#pragma mark Request Offers Notification Methods


// 请求应用列表成功
//
// 详解:
//      应用列表请求成功后回调该方法
// 补充:
//      查看YOUMI_OFFERS_RESPONSE_NOTIFICATION
//
- (void)didReceiveOffers:(YouMiWall *)adWall{
    [adWall showOffers];
    isRequested = YES;
}

// 请求应用列表失败
//
// 详解:
//      应用列表请求失败后回调该方法
// 补充:
//      查看YOUMI_OFFERS_RESPONSE_NOTIFICATION_ERROR
//
- (void)didFailToReceiveOffers:(YouMiWall *)adWall error:(NSError *)error{
    NSLog(@"%s error-->%@",__FUNCTION__,error);
    [adsMogoCore didFailedGetWall:@"请求有米积分墙失败"];
}

#pragma mark Screen View Notification Methods

// 显示全屏页面
//
// 详解:
//      全屏页面显示完成后回调该方法
// 补充:
//      查看YOUMI_WALL_VIEW_OPENED_NOTIFICATION
//
- (void)didShowWallView:(YouMiWall *)adWall{
    [adsMogoCore didSuccessOpenWall:configAdapter];
}

// 隐藏全屏页面
//
// 详解:
//      全屏页面隐藏完成后回调该方法
// 补充:
//      查看YOUMI_WALL_VIEW_CLOSED_NOTIFICATION
//
- (void)didDismissWallView:(YouMiWall *)adWall{
}
// 查询积分情况成功
// @info 里面包含积分记录的NSDictionary
//
// 详解:
//      积分查询请求成功后回调该方法
// 补充:
//      查看YOUMI_EARNED_POINTS_RESPONSE_NOTIFICATION
//
- (void)didReceiveEarnedPoints:(YouMiWall *)adWall info:(NSArray *)info{
    NSInteger point = 0;
    for (NSDictionary *oneRecord in info) {
        point += [(NSNumber *)[oneRecord objectForKey:kOneAccountRecordPoinstsOpenKey] integerValue];
    }
    [pointDelegate didGetPoint:point andNetworkAdapterType:AdsMogoNetworkYouMi];
}

// 查询积分情况失败
//
// 详解:
//      积分查询请求失败后回调该方法
// 补充:
//      查看YOUMI_EARNED_POINTS_RESPONSE_NOTIFICATION_ERROR
//
- (void)didFailToReceiveEarnedPoints:(YouMiWall *)adWall error:(NSError *)error{
    [pointDelegate didFaildGetPointNetworkAdapterType:AdsMogoNetworkYouMi];
}
@end
