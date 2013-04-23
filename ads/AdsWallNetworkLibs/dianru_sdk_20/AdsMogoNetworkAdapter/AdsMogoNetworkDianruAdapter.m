//
//  AdsMogoNetworkDianruAdapter.m
//  TestIntegralWall
//
//  Created by Mogo on 12-12-17.
//  Copyright (c) 2012年 Mogo. All rights reserved.
//

#import "AdsMogoNetworkDianruAdapter.h"

@implementation AdsMogoNetworkDianruAdapter

+(void)load{
    [[AdsMoGoAdWallNetworkRegistry sharedRegistry] registerClass:self];
}

+(AdsMogoNetworkType)getAdsMogoNetworkType{
    return AdsMogoNetworkDianru;
}
-(void)getAdWall{
    [DianRuAdWall initAdWallWithDianRuAdWallDelegate:self];
}

-(void)showAdWall{
    [DianRuAdWall showAdWall:(UIViewController *)[wallDelegate adsWallNeedController]];
    
    [adsMogoCore didSuccessOpenWall:configAdapter];
}

-(void)getPoint{
    [DianRuAdWall getRemainPoint];
}

-(void)spendPoint:(NSInteger)aPoint{
    [DianRuAdWall spendPoint:aPoint];
}

/*
 用于消费积分结果的回调
 */
-(void)didReceiveSpendScoreResult:(BOOL)isSuccess{
    [pointDelegate didSpendPoint:isSuccess];
}

/*
 用于获取剩余积分结果的回调
 */
-(void)didReceiveGetScoreResult:(int)point{
    [pointDelegate didGetPoint:point andNetworkAdapterType:AdsMogoNetworkDianru];
}

/*
 应用程序唯一标识，从点入后台获取
 */
-(NSString *)applicationKey{
    return [configAdapter objectForKey:@"key"];//00001304090000C5
}

-(NSString *)dianruAdWallAppUserId{
    return @"111";
}
@end
