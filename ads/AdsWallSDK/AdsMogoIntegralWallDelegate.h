//
//  AdsMogoIntegralWallDelegate.h
//  MOGOIntegralWallSDK
//
//  Created by Mogo on 12-12-17.
//  Copyright (c) 2012年 Mogo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol AdsMogoIntegralWallDelegate <NSObject>

@required
-(id)adsWallNeedController;//您需要将一个viewcontroller作为返回值

-(void)didGetThePoint:(int)aPoint;//取积分操作回调，返回总积分

-(void)didRefreshThePoint:(int)aPoint;//刷新积分操作回调，返回总积分

-(void)didChangedThePoint:(int)aPoint andChangedPoint:(int)aCpoint;//加减积分的回调，aPoint返回总积分 aCpoint是改变的积分数(加10分返回的aCpoint就是10,减10分返回的就是-10)

@optional
-(void)didReceiveMogoWallConfig;//获取用户在mogo的配置完成

-(void)showWallByPriority:(NSArray *)configs;//后台配置按顺序展示的时候，当您调用showWall时回调，返回一个数组，数组成员是每个平台的信息字典

-(void)didFailedGetWall:(NSString *)error;//当无法从网上获取配置信息的时候回调，失败展示积分墙

-(void)didSuccessOpenWall:(NSDictionary *)config;//展示积分墙回调，成功展示积分墙


@end
