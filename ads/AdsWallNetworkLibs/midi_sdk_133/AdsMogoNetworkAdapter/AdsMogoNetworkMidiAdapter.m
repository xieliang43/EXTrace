//
//  AdsMogoNetworkMidiAdapter.m
//  TestIntegralWall
//
//  Created by Mogo on 12-12-21.
//  Copyright (c) 2012年 Mogo. All rights reserved.
//

#import "AdsMogoNetworkMidiAdapter.h"

@implementation AdsMogoNetworkMidiAdapter
+(void)load{
    [[AdsMoGoAdWallNetworkRegistry sharedRegistry] registerClass:self];
}

+(AdsMogoNetworkType)getAdsMogoNetworkType{
    return AdsMogoNetworkMidi;
}
-(void)getAdWall{
    [MiidiManager setAppPublisher:[[configAdapter objectForKey:@"key"] objectForKey:@"ProductId"]  withAppSecret:[[configAdapter objectForKey:@"key"] objectForKey:@"PasswordId"] withTestMode:[[configAdapter objectForKey:@"testmodel"] boolValue]];
}

-(void)showAdWall{
    [MiidiAdWall showAppOffers:[wallDelegate adsWallNeedController] withDelegate:self];
}

-(void)getPoint{
    [MiidiAdWall requestGetPoints:self];
}

-(void)spendPoint:(NSInteger)aPoint{
}

#pragma mark -
#pragma mark  MiidiAdWallShowAppOffersDelegate


// 请求应用列表成功
//
// 详解:
//      广告墙请求成功后回调该方法
// 补充:

//
- (void)didReceiveOffers{
    [adsMogoCore didSuccessOpenWall:configAdapter];
}

// 请求应用列表失败
//
// 详解:
//      广告墙请求失败后回调该方法
// 补充:

//
- (void)didFailToReceiveOffers:(NSError *)error{
    [adsMogoCore didFailedGetWall:error.description];
}

#pragma mark Screen View Notification Methods

// 显示全屏页面
//
// 详解:
//      全屏页面显示完成后回调该方法
// 补充:

//
- (void)didShowWallView{
}

// 隐藏全屏页面
//
// 详解:
//      全屏页面隐藏完成后回调该方法
// 补充:

//
- (void)didDismissWallView{
}

#pragma mark  end

#pragma mark  MiidiAdWallSpendPointsDelegate


- (void)didReceiveSpendPoints:(NSInteger)totalPoints{
	NSLog(@"midi didReceiveSpendPoints success! totalPoints=%d",totalPoints);
}


- (void)didFailReceiveSpendPoints:(NSError *)error{
	NSLog(@"midi didFailReceiveSpendPoints failed!");

}

#pragma mark  MiidiAdWallGetPointsDelegate


- (void)didReceiveGetPoints:(NSInteger)totalPoints forPointName:(NSString*)pointName{
    if (totalPoints != 500000) {
        [pointDelegate didGetPoint:totalPoints andNetworkAdapterType:AdsMogoNetworkMidi];
    }else{
        [pointDelegate didFaildGetPointNetworkAdapterType:AdsMogoNetworkMidi];
    }
	
}


- (void)didFailReceiveGetPoints:(NSError *)error{
	NSLog(@"midi didFailReceiveGetPoints failed!");
	[pointDelegate didFaildGetPointNetworkAdapterType:AdsMogoNetworkMidi];
}


@end
