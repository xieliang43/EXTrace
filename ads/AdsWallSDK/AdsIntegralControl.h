//
//  AdsIntegralControl.h
//  MOGOIntegralWallSDK
//
//  Created by Mogo on 12-12-17.
//  Copyright (c) 2012年 Mogo. All rights reserved.
//
//  积分控制类:  初始化本地积分池->通过资源文件plist
//  接口: 查询接口、加分接口、减分接口、刷新接口

#import <Foundation/Foundation.h>
#import "AdsMogoConfig.h"
#import "AdsMogoIntegralWallDelegate.h"
#import "AdsMogoCoreControl.h"
#import "AdsMogoPointDelegate.h"

//pointDic中的总积分键名
#define KTOTALPOINT @"totalPoint"
@class AdsMogoCoreControl;
@interface AdsIntegralControl : NSObject<AdsMogoPointDelegate>
{
    id<AdsMogoIntegralWallDelegate> wallDelegate;
    NSMutableDictionary *pointDic;
    NSOperationQueue *opQueue;
    AdsMogoCoreControl *core;
    NSMutableArray *configDicArr;
    
    //一次刷新所变化的积分
    int refreshPoint;
    //需要刷新的平台个数
    int refreshAdapterNumber;
    //防止多次点击刷新按钮
    BOOL isRefreshStop;
    //是否输出日志
    BOOL ifNSLog;
    //刷新超时
    NSTimer *refreshTimer;
    //停止标记
    BOOL isStop;
}
@property(nonatomic, retain)AdsMogoCoreControl *core;
@property(nonatomic, retain)NSMutableDictionary *pointDic;
@property(nonatomic, assign,setter = setWallDelegate:)id<AdsMogoIntegralWallDelegate> wallDelegate;
@property(nonatomic,retain,setter = setAppKey:)NSString *appKey;
/***************单例函数****************/
/*************参数:nil*****************/
/******返回值:AdsIntegralControl * *****/
+(AdsIntegralControl *)shareIntegralControl;

/************将各平台的积分初始化****************/
/*************参数:配置字典*****************/
/*************返回值:void*********/
-(void)initEverySDKPointWithConfig:(NSMutableArray *)rations;

/************查积分函数****************/
/*************参数:nil*****************/
/*************返回值:NSInteger*********/
-(void)getPoint;

/**************加积分函数****************/
/*************参数:NSInteger*************/
/*************返回值:BOOL成功否***********/
-(void)addPoint:(NSInteger)aPoint;

/**************减积分函数****************/
/*************参数:NSInteger*************/
/*************返回值:BOOL成功否***********/
-(void)spendPoint:(NSInteger)aPoint;

/**************刷新积分函数****************/
/*************参数:nil*************/
/*************返回值:BOOL成功否***********/
-(void)refreshPoint;

/**************保存积分函数****************/
/*************参数:nil*************/
/*************返回值:BOOL成功否***********/
-(BOOL)saveThePoint;

/**
 *停止积分操作
 */
-(void)stopPointControl;
@end
