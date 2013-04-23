//
//  AdsMogoNetworkDomobAdapter.h
//  TestIntegralWall
//
//  Created by Daxiong on 13-2-25.
//  Copyright (c) 2013年 Mogo. All rights reserved.
//

#import "AdsMogoNetworkAdapter.h"
#import "DMOfferWallViewController.h"

@interface AdsMogoNetworkDomobAdapter : AdsMogoNetworkAdapter<DMOfferWallDelegate>{
    DMOfferWallViewController *_offerWallController;
    BOOL isLoading,isLoadFinish,isNeedShow;
}

@end
