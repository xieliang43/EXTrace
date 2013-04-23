//
//  AdsMogoNetworkImmobAdapter.m
//  TestIntegralWall
//
//  Created by Mogo on 12-12-25.
//  Copyright (c) 2012年 Mogo. All rights reserved.
//

#import "AdsMogoNetworkImmobAdapter.h"

@implementation AdsMogoNetworkImmobAdapter
+(void)load{
    [[AdsMoGoAdWallNetworkRegistry sharedRegistry] registerClass:self];
}

+(AdsMogoNetworkType)getAdsMogoNetworkType{
    return AdsMogoNetworkImmob;
}

- (UIViewController *)immobViewController{
    return (UIViewController *)[wallDelegate adsWallNeedController];
}

-(void)getAdWall{
    adView = [[immobView alloc] initWithAdUnitID:[configAdapter objectForKey:@"key"]];
//    [adView.UserAttribute setObject:@"immobSDK" forKey:@"immobSDK"];
    adView.delegate=self;
}

-(void)showAdWall{
    [adView immobViewRequest];
}

-(void)immobViewDidReceiveAd{
    [adsMogoCore didSuccessOpenWall:configAdapter];
    [((UIViewController *)[wallDelegate adsWallNeedController]).view addSubview:adView];
    [adView immobViewDisplay];
}

- (void) immobView: (immobView*) immobView didFailReceiveimmobViewWithError: (NSInteger) errorCode{
    [adsMogoCore didFailedGetWall:[NSString stringWithFormat:@"%d",errorCode]];
}

-(void)getPoint{
    [adView immobViewQueryScoreWithAdUnitID:[configAdapter objectForKey:@"key"]];
}

-(void)spendPoint:(NSInteger)aPoint{
}

- (void) immobViewQueryScore:(NSUInteger)score WithMessage:(NSString *)message{
    [pointDelegate didGetPoint:score andNetworkAdapterType:AdsMogoNetworkImmob];
}

-(void)dealloc{
    if (adView) {
        [adView release];
        adView = nil;
    }
    [super dealloc];
}


@end
