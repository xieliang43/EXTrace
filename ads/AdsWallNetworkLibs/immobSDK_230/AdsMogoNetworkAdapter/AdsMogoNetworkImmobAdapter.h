//
//  AdsMogoNetworkImmobAdapter.h
//  TestIntegralWall
//
//  Created by Mogo on 12-12-25.
//  Copyright (c) 2012年 Mogo. All rights reserved.
//

#import "AdsMogoNetworkAdapter.h"
#import <immobSDK/immobView.h>

@interface AdsMogoNetworkImmobAdapter : AdsMogoNetworkAdapter<immobViewDelegate>
{
    immobView *adView;
}
@end
