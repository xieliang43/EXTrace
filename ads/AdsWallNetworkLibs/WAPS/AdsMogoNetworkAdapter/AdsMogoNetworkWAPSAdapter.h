//
//  AdsMogoNetworkWAPSAdapter.h
//  TestIntegralWall
//
//  Created by Mogo on 12-12-26.
//  Copyright (c) 2012年 Mogo. All rights reserved.
//

#import "AdsMogoNetworkAdapter.h"
#import "WapsOffer/AppConnect.h"

@interface AdsMogoNetworkWAPSAdapter : AdsMogoNetworkAdapter
{
    //判断是否已经返回积分，防止有的平台一次请求积分失败后会再次请求，导致刷新积分操作的平台数增加
    BOOL ifReturnResult;
}

@end
