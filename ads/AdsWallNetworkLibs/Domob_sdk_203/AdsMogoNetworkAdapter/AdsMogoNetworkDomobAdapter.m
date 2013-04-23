//
//  AdsMogoNetworkDomobAdapter.m
//  TestIntegralWall
//
//  Created by Daxiong on 13-2-25.
//  Copyright (c) 2013年 Mogo. All rights reserved.
//

#import "AdsMogoNetworkDomobAdapter.h"

@implementation AdsMogoNetworkDomobAdapter
+(void)load{
    [[AdsMoGoAdWallNetworkRegistry sharedRegistry] registerClass:self];
}

+(AdsMogoNetworkType)getAdsMogoNetworkType{
    return AdsMogoNetworkDomob;
}
/**
 *初始化Adapter
 *请勿改动
 */
-(id)initAdsMogoNetworkAdapterByConfig:(NSDictionary *)config core:(AdsMogoCoreControl *)core pointDelegate:(id<AdsMogoPointDelegate>)aPointDelegate wallDelegate:(id<AdsMogoIntegralWallDelegate>)aWallDelegate{
    if (!self) {
        self = [super init];
        isLoading = NO;
        isLoadFinish = NO;
    }
    if (self) {
        adsMogoCore = core;
        pointDelegate = aPointDelegate;
        wallDelegate = aWallDelegate;
        if (configAdapter) {
            [configAdapter release];
            configAdapter = nil;
        }
        configAdapter = [[NSDictionary alloc] initWithDictionary:config];
    }
    return self;
    
}

/**
 *初始化_offerWallController
 */
-(void)initDomobWall{
    if (!_offerWallController&&!isLoading) {
        isLoading = YES;
        _offerWallController = [[DMOfferWallViewController alloc] initWithPublisherID:[configAdapter objectForKey:@"key"]];
        _offerWallController.delegate = self;
        [_offerWallController loadOfferWall];
    }
}

-(void)getAdWall{
    [self initDomobWall];
}

-(void)showAdWall{
    if (isLoadFinish) {
        [_offerWallController presentOfferWallWithViewController:[wallDelegate adsWallNeedController]];
        [adsMogoCore didSuccessOpenWall:configAdapter];
    }else{
        isNeedShow = YES;
    }
}

-(void)getPoint{
    if (!isLoadFinish) {
        [pointDelegate didFaildGetPointNetworkAdapterType:AdsMogoNetworkDomob];
    }else{
        [_offerWallController requestOnlinePointCheck];
    }
}
-(void)dealloc{

    if (_offerWallController) {
        _offerWallController.delegate = nil;
        [_offerWallController release],_offerWallController = nil;
    }
    [super dealloc];
}
#pragma mark -
#pragma mark Domob delegate
// 积分墙开始加载数据。
// Offer wall starts to work.
- (void)offerWallDidStartLoad{
}
// 积分墙加载完成。此方法实现中可进行积分墙入口Button显示等操作。
// Load offer wall successfully. You can set your IBOutlet.hidden to NO in this callback.
// This IBOutlet is the one which response to present OfferWall.
- (void)offerWallDidFinishLoad{
    isLoadFinish = YES;
    if (isNeedShow) {
        isNeedShow = NO;
        [_offerWallController presentOfferWallWithViewController:[wallDelegate adsWallNeedController]];
        [adsMogoCore didSuccessOpenWall:configAdapter];
    }
}
// 积分墙加载失败。可能的原因由error部分提供，例如网络连接失败、被禁用等。建议在此隐藏积分墙入口Button。
// Failed to load offer wall. You should set THE IBOutlet.hidden to YES in this callback.
- (void)offerWallDidFailLoadWithError:(NSError *)error{
    
    NSLog(@"domob wall error-->%@",error);
    isNeedShow = NO;
    [adsMogoCore didFailedGetWall:@"domob wall error"];
}
// 关闭积分墙页面。
// Offer wall closed.
- (void)offerWallDidClosed{}
#pragma mark Point Check Callbacks
// 积分查询成功之后，回调该接口，获取总积分和总已消费积分。
- (void)offerWallDidFinishCheckPointWithTotalPoint:(NSInteger)totalPoint
                             andTotalConsumedPoint:(NSInteger)consumed{
    [pointDelegate didGetPoint:totalPoint andNetworkAdapterType:AdsMogoNetworkDomob];
}
// 积分查询失败之后，回调该接口，返回查询失败的错误原因。
- (void)offerWallDidFailCheckPointWithError:(NSError *)error{
    [pointDelegate didFaildGetPointNetworkAdapterType:AdsMogoNetworkDomob];
}
#pragma mark Consume Callbacks
// 消费请求正常应答后，回调该接口，并返回消费状态（成功或余额不足），以及总积分和总已消费积分。
- (void)offerWallDidFinishConsumePointWithStatusCode:(DMOfferWallConsumeStatusCode)statusCode
                                          totalPoint:(NSInteger)totalPoint
                                  totalConsumedPoint:(NSInteger)consumed{}
// 消费请求异常应答后，回调该接口，并返回异常的错误原因。
- (void)offerWallDidFailConsumePointWithError:(NSError *)error{}
@end
