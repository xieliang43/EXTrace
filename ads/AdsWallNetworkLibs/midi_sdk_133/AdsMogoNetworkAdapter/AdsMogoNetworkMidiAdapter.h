//
//  AdsMogoNetworkMidiAdapter.h
//  TestIntegralWall
//
//  Created by Mogo on 12-12-21.
//  Copyright (c) 2012年 Mogo. All rights reserved.
//

#import "AdsMogoNetworkAdapter.h"
#import "MiidiAdWall.h"
#import "MiidiManager.h"
#import "MiidiAdWallShowAppOffersDelegate.h"
#import "MiidiAdWallAwardPointsDelegate.h"
#import "MiidiAdWallSpendPointsDelegate.h"
#import "MiidiAdWallGetPointsDelegate.h"

@interface AdsMogoNetworkMidiAdapter : AdsMogoNetworkAdapter<MiidiAdWallShowAppOffersDelegate
, MiidiAdWallAwardPointsDelegate
, MiidiAdWallSpendPointsDelegate
, MiidiAdWallGetPointsDelegate>
{
}

@end
