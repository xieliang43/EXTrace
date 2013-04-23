//
//  AdsMogoCoreControl.h
//  MOGOIntegralWallSDK
//
//  Created by Mogo on 12-12-17.
//  Copyright (c) 2012年 Mogo. All rights reserved.
//
//  核心控制器:轮换积分墙  初始化->查询配置信息—>初始化对应适配器
//  接口: 展示积分墙

#import <Foundation/Foundation.h>
#import "AdsIntegralControl.h"
#import "AdsMogoIntegralWallDelegate.h"
#import "AdsMogoNetworkAdapter.h"
#import "AdsMogoConfig.h"

@class AdsMogoNetworkAdapter;
@class AdsMoGoWallAdApterFactory;

@interface AdsMogoCoreControl : NSObject<AdsMogoConfigDelegate,AdsMogoIntegralWallDelegate>
{
    AdsMogoConfig *adsMogoWallConfig;
    
    
    id<AdsMogoIntegralWallDelegate> wallDelegate;
    AdsMogoNetworkAdapter *adapter;

    
    NSString *wallAppId;
    BOOL isStop;
    
}
@property(assign)id<AdsMogoIntegralWallDelegate> wallDelegate;
@property(nonatomic, retain)NSString *wallAppId;

-(id)initCoreWithDelegate:(id)aDelegate AndAppId:(NSString *)appId;

-(void)showWall;

-(void)showWallByConfig:(NSDictionary *)config;

-(void)getPoint;

-(void)spendPoint:(NSInteger)aPoint;

-(void)addPoint:(NSInteger)aPoint;

-(void)refreshPoint;

-(BOOL)saveThePoint;

-(void)stopCore;
@end
