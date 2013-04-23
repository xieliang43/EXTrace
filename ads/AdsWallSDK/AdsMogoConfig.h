//
//  AdsMogoConfig.h
//  MOGOIntegralWallSDK
//
//  Created by Mogo on 12-12-17.
//  Copyright (c) 2012年 Mogo. All rights reserved.
//
//  配置信息类:  初始化 ->第一次请求配置->成功&更新本地文件
//                   ->查询改变->Y：更新本地文件;N：无处理->用本地文件生成配置信息
//                   ->失败处理:第一次请求失败处理 查询改变失败处理
//  接口:  查询配置  

#import <Foundation/Foundation.h>

@protocol AdsMogoConfigDelegate ;
@interface AdsMogoConfig : NSObject{
    
    NSMutableDictionary *extra;
    NSMutableArray *rations;
    NSString *appId;
}

@property (nonatomic,assign)id<AdsMogoConfigDelegate> delegate;
@property (nonatomic,assign)BOOL isStop;

-(id)initWithAppid:(NSString *)wallAppId;
-(void)initConfig;
-(BOOL)isHaveExtra;
-(BOOL)isHaveRations;
-(NSMutableDictionary *)getExtra;
-(NSMutableArray *)getRations;
@end
@protocol AdsMogoConfigDelegate <NSObject>

@optional
-(void)AdsMogoConfigDidLoadCache:(AdsMogoConfig *)adsMogoConfig;
-(void)AdsMogoConfigLoadCacheFail:(AdsMogoConfig *)adsMogoConfig;
@end