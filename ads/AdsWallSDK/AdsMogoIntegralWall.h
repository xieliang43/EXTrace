//
//  AdsMogoIntegralWall.h
//  MOGOIntegralWallSDK
//
//  Created by Mogo on 12-12-17.
//  Copyright (c) 2012年 Mogo. All rights reserved.

//  积分墙类 

#import <Foundation/Foundation.h>

#import "AdsMogoIntegralWallDelegate.h"

@interface AdsMogoIntegralWall : NSObject<AdsMogoIntegralWallDelegate>
{
    id<AdsMogoIntegralWallDelegate> wallDelegate;//芒果代理
}
@property(nonatomic, assign)id<AdsMogoIntegralWallDelegate> wallDelegate;
@property(nonatomic, retain)NSString *appKey;

/********************************************/
/*************初始化积分墙*********************/
/*************参数：代理类，芒果ID**************/
-(id)initWallWithDelegate:(id)aDelegate AndAppId:(NSString *)appId;


/******************************************/
/*************展示积分墙接口******************/
/*************参数无************************/
-(void)showWall;


/*************说明：此操作需要在调用showWall后
     展示一个您自己根据回调返回的平台信息array组织的一个页面，
     并在次页面中点击操作后调用次接口
     从平台信息array中取对应的Dictionary*************/
/*************按顺序展示积分墙接口*******************/
/*************参数：平台的配置信息字典****************/
-(void)showWallByConfig:(NSDictionary *)config;


/******************************************/
/*************获取积分操作*********************/
/******************************************/
-(void)getPoint;


/******************************************/
/*************消耗积分操作*******************/
/*************参数：需要减的积分**************/
-(void)spendPoint:(NSInteger)aPoint;


/******************************************/
/*************增加积分操作*******************/
/*************参数：需要加的积分**************/
-(void)addPoint:(NSInteger)aPoint;


/******************************************/
/*************刷新积分操作*******************/
/******************************************/
-(void)refreshPoint;


/**强烈建议您在viewWillDisappear中操作保存积分,
   我们会在芒果积分墙类销毁的时候保存积分，
   但是希望您在viewWillDisappear中再次保存*****/
/*************保存积分操作*******************/
/******************************************/
-(BOOL)savePoint;
@end
