//
//  AdsMogoNetworkTapjoyAdapter.h
//  TestIntegralWall
//
//  Created by Mogo on 12-12-25.
//  Copyright (c) 2012年 Mogo. All rights reserved.
//

#import "AdsMogoNetworkAdapter.h"
#import "TapjoyConnect.h"

@interface AdsMogoNetworkTapjoyAdapter : AdsMogoNetworkAdapter<TJCAdDelegate>
{
    BOOL isGetPoint;
}

@end
