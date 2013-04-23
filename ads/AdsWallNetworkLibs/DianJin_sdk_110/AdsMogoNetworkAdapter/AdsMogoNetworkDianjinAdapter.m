//
//  AdsMogoNetworkDianjinAdapter.m
//  TestIntegralWall
//
//  Created by Mogo on 12-12-25.
//  Copyright (c) 2012年 Mogo. All rights reserved.
//

#import "AdsMogoNetworkDianjinAdapter.h"
#import <DianJinOfferPlatform/DianJinOfferPlatform.h>
#import <DianJinOfferPlatform/DianJinPlatformError.h>
#import <DianJinOfferPlatform/DianJinTransitionParam.h>
#import <DianJinOfferPlatform/DianJinOfferPlatformProtocol.h>

@implementation AdsMogoNetworkDianjinAdapter
+(void)load{
    [[AdsMoGoAdWallNetworkRegistry sharedRegistry] registerClass:self];
}

+(AdsMogoNetworkType)getAdsMogoNetworkType{
    return AdsMogoNetworkDianjin;
}
-(void)getAdWall{
    [[DianJinOfferPlatform defaultPlatform] setAppId:[[[configAdapter objectForKey:@"key"] objectForKey:@"AppId"] intValue] andSetAppKey:[[configAdapter objectForKey:@"key"] objectForKey:@"AppKey"]];
	[[DianJinOfferPlatform defaultPlatform] setOfferViewColor:kDJBrownColor];
}

-(void)showAdWall{
    [[DianJinOfferPlatform defaultPlatform] showOfferWall:((UIViewController *)wallDelegate) delegate:self];
}

-(void)getPoint{
    int result = [[DianJinOfferPlatform defaultPlatform] getBalance:self];
	if (result != DIAN_JIN_NO_ERROR) {
		NSLog(@"consume result = %d", result);
        [pointDelegate didFaildGetPointNetworkAdapterType:AdsMogoNetworkDianjin];
	}
}


#pragma mark - 
#pragma mark -dianjin delegate
- (void)offerViewDidOpen {
    [adsMogoCore didSuccessOpenWall:configAdapter];
}
- (void)offerViewDidClose {
    [adsMogoCore didSuccessOpenWall:configAdapter];
}
- (void)getBalanceDidFinish:(NSDictionary *)dict {
    NSNumber *result = [dict objectForKey: @"result"];
    if ([result intValue] == DIAN_JIN_NO_ERROR) {
        
        NSNumber *balance = [dict objectForKey:@"balance"];
        [pointDelegate didGetPoint:[balance intValue] andNetworkAdapterType:AdsMogoNetworkDianjin];
        
    }else if ([result intValue] == DIAN_JIN_ERROR_USER_NOT_AUTHORIZED) {
        NSLog(@"Dianjin--未授权的 appId 和 appKey");
    }else {
        NSLog(@"Dianjin--获取余额失败,错误码为:%d", [result intValue]);
    }
}
@end
