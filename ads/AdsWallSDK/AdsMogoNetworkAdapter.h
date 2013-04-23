//
//  AdsMogoNetworkAdapter.h
//  MOGOIntegralWallSDK
//
//  Created by Mogo on 12-12-17.
//  Copyright (c) 2012年 Mogo. All rights reserved.
//  适配器父类: 初始化
//  接口: 展示积分墙  查询积分

#import <Foundation/Foundation.h>
#import "AdsMogoConfig.h"
#import "AdsMogoPointDelegate.h"
#import "AdsMogoIntegralWallDelegate.h"
#import "AdsMogoCoreControl.h"
#import "AdsMoGoAdWallNetworkRegistry.h"

@class AdsMogoCoreControl;
typedef enum{
    AdsMogoNetworkYouMi      = 224,
    AdsMogoNetworkDomob      = 229,
    AdsMogoNetworkMobiSage   = 231,
    AdsMogoNetworkMidi       = 257,
    AdsMogoNetworkWAPS       = 258,
    AdsMogoNetworkDianjin    = 261,
    AdsMogoNetworkImmob      = 246,
    AdsMogoNetworkAppDriver  = 264,
    AdsMogoNetworkTapjoy     = 265,
    AdsMogoNetworkDianru     = 268,
    AdsMogoNetworkMogo       = 270
//    AdsMogoNetworkJuzi   = 271
} AdsMogoNetworkType;

@interface AdsMogoNetworkAdapter : NSObject
{
    id<AdsMogoPointDelegate> pointDelegate;
    id<AdsMogoIntegralWallDelegate> wallDelegate;
    AdsMogoCoreControl *adsMogoCore;
    AdsMogoConfig *adsMogoConfig;
    
    NSDictionary *configAdapter;
    
}
/************初始化适配器****************/
/*************参数:nil*****************/
/*************返回值:void**************/
-(id)initAdsMogoNetworkAdapterByConfig:(NSDictionary *)config core:(AdsMogoCoreControl *)core pointDelegate:(id<AdsMogoPointDelegate>)aPointDelegate wallDelegate:(id<AdsMogoIntegralWallDelegate>)aWallDelegate;

/**
 *添加Delegate到队列中
 */
-(void)addDelegateInQueue:(id<AdsMogoIntegralWallDelegate>)delegate andPointDelegate:(id<AdsMogoPointDelegate>)aPDelegate;

/************初始化积分墙*****************/
/*************参数:nil*****************/
/*************返回值:void**************/
-(void)getAdWall;

/************展示积分墙*****************/
/*************参数:nil*****************/
/*************返回值:void**************/
-(void)showAdWall;

/**************查询积分****************/
/*************参数:nil****************/
/*************返回值:NSinteger********/
-(void)getPoint;

/************消费积分*******************/
/*************参数:NSInteger***********/
/*************返回值:void**************/
-(void)spendPoint:(NSInteger)aPoint;
@end
